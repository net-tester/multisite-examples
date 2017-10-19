# coding: utf-8

Given(/^環境変数 VLAN_ID のユーザグループ$/) do |table|
  vlan_id = ENV['VLAN_ID'].to_i
  # Cucumber.logger.info "対象VLAN ID: #{vlan_id}\n"
  @testnode = {}
  table.hashes.each do |each|
    @testnode[each['ノード']] = TestNode.new(attributes_for(each['ノード'].to_sym), vlan_id)
  end
end

Given(/^通信要件表$/) do |table|
  # 表を保存
  @requirements = []
  table.hashes.each do |each|
    @requirements << {src: each['送信元'], dest: each['送信先'], access: each['通信可否']}
  end
end

When(/^通信要件どおりに ping$/) do
  # 捨てping
  @requirements.each do |requirement|
    src_host_name = requirement[:src]
    dest_host_name = requirement[:dest]

    requirement[:id] = @testnode[src_host_name].exec("ping " + @testnode[dest_host_name].ip_address + " -c 1")
  end

  # 本チャン
  @requirements.each do |requirement|
    src_host_name = requirement[:src]
    dest_host_name = requirement[:dest]

    @testnode[src_host_name].result(requirement[:id])
    requirement[:id] = @testnode[src_host_name].exec("ping " + @testnode[dest_host_name].ip_address + " -c 4")
  end
end

Then(/^通信要件どおりに ping 成功$/) do
  failure_count = 0
  failure_message = ""
  @requirements.each do |requirement|
    src_host_name = requirement[:src]
    dest_host_name = requirement[:dest]

    result = @testnode[src_host_name].result(requirement[:id])

    if(requirement[:access] == 'O') then
      if(result !~ /4 received, 0% packet loss/) then
        failure_count += 1
        failure_message += "unexpected: #{src_host_name} -> #{dest_host_name}\n"
      end
    else
      if(result !~ /100% packet loss/) then
        failure_count += 1
        failure_message += "unexpected: #{src_host_name} -> #{dest_host_name}\n"
      end
    end
  end
  expect(failure_count).to eql(0), "#{failure_message}"
end

