@multi-site @cts0 @oka0
Feature: VLAN 開通確認 (cts0-oka0)

  Backbone チーム担当者として、
  拠点 Provider Edge 間で通信できるかどうか確認したい
  なぜなら、 VLAN 開通設定を間違えることがあるから

  Scenario: VLAN 開設後の ping
    Given 環境変数 VLAN_ID のユーザグループ
      | 拠点 | ノード |
      | cts0 | cts01  |
      | cts0 | cts02  |
      | oka0 | oka01  |
      | oka0 | oka02  |
    And 通信要件表
      | 送信元 | 送信先 | 通信可否 |
      | cts01  | cts02  | O        |
      | cts01  | oka01  | O        |
      | cts01  | oka02  | O        |
      | cts02  | cts01  | O        |
      | cts02  | oka01  | O        |
      | cts02  | oka02  | O        |
      | oka01  | cts01  | O        |
      | oka01  | cts02  | O        |
      | oka01  | oka02  | O        |
      | oka02  | cts01  | O        |
      | oka02  | cts02  | O        |
      | oka02  | oka01  | O        |
    When 通信要件どおりに ping
    Then 通信要件どおりに ping 成功

