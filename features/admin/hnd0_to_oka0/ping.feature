@multi-site @hnd0 @oka0
Feature: VLAN 開通確認 (hnd0-oka0)

  Backbone チーム担当者として、
  拠点 Provider Edge 間で通信できるかどうか確認したい
  なぜなら、 VLAN 開通設定を間違えることがあるから

  Scenario: VLAN 開設後の ping
    Given 環境変数 VLAN_ID のユーザグループ
      | 拠点 | ノード |
      | hnd0 | hnd01  |
      | hnd0 | hnd02  |
      | oka0 | oka01  |
      | oka0 | oka02  |
    And 通信要件表
      | 送信元 | 送信先 | 通信可否 |
      | hnd01  | hnd02  | O        |
      | hnd01  | oka01  | O        |
      | hnd01  | oka02  | O        |
      | hnd02  | hnd01  | O        |
      | hnd02  | oka01  | O        |
      | hnd02  | oka02  | O        |
      | oka01  | hnd01  | O        |
      | oka01  | hnd02  | O        |
      | oka01  | oka02  | O        |
      | oka02  | hnd01  | O        |
      | oka02  | hnd02  | O        |
      | oka02  | oka01  | O        |
    When 通信要件どおりに ping
    Then 通信要件どおりに ping 成功

