@multi-site @nrt0 @cts0
Feature: VLAN 開通確認 (nrt0-cts0)

  Backbone チーム担当者として、
  拠点 Provider Edge 間で通信できるかどうか確認したい
  なぜなら、 VLAN 開通設定を間違えることがあるから

  Scenario: VLAN 開設後の ping
    Given 環境変数 VLAN_ID のユーザグループ
      | 拠点 | ノード |
      | nrt0 | nrt01  |
      | nrt0 | nrt02  |
      | cts0 | cts01  |
      | cts0 | cts02  |
    And 通信要件表
      | 送信元 | 送信先 | 通信可否 |
      | nrt01  | nrt02  | O        |
      | nrt01  | cts01  | O        |
      | nrt01  | cts02  | O        |
      | nrt02  | nrt01  | O        |
      | nrt02  | cts01  | O        |
      | nrt02  | cts02  | O        |
      | cts01  | nrt01  | O        |
      | cts01  | nrt02  | O        |
      | cts01  | cts02  | O        |
      | cts02  | nrt01  | O        |
      | cts02  | nrt02  | O        |
      | cts02  | cts01  | O        |
    When 通信要件どおりに ping
    Then 通信要件どおりに ping 成功

