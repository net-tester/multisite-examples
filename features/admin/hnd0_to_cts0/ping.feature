@multi-site @hnd0 @cts0
Feature: VLAN 開通確認 (hnd0-cts0)

  Backbone チーム担当者として、
  拠点 Provider Edge 間で通信できるかどうか確認したい
  なぜなら、 VLAN 開通設定を間違えることがあるから

  Scenario: VLAN 開設後の ping
    Given 環境変数 VLAN_ID のユーザグループ
      | 拠点 | ノード |
      | hnd0 | hnd01  |
      | hnd0 | hnd02  |
      | cts0 | cts01  |
      | cts0 | cts02  |
    And 通信要件表
      | 送信元 | 送信先 | 通信可否 |
      | hnd01  | hnd02  | O        |
      | hnd01  | cts01  | O        |
      | hnd01  | cts02  | O        |
      | hnd02  | hnd01  | O        |
      | hnd02  | cts01  | O        |
      | hnd02  | cts02  | O        |
      | cts01  | hnd01  | O        |
      | cts01  | hnd02  | O        |
      | cts01  | cts02  | O        |
      | cts02  | hnd01  | O        |
      | cts02  | hnd02  | O        |
      | cts02  | cts01  | O        |
    When 通信要件どおりに ping
    Then 通信要件どおりに ping 成功

