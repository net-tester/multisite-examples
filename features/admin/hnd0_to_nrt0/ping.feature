@multi-site @hnd0 @nrt0
Feature: VLAN 開通確認 (hnd0-nrt0)

  Backbone チーム担当者として、
  拠点 Provider Edge 間で通信できるかどうか確認したい
  なぜなら、 VLAN 開通設定を間違えることがあるから

  Scenario: VLAN 開設後の ping
    Given 環境変数 VLAN_ID のユーザグループ
      | 拠点 | ノード |
      | hnd0 | hnd01  |
      | hnd0 | hnd02  |
      | nrt0 | nrt01  |
      | nrt0 | nrt02  |
    And 通信要件表
      | 送信元 | 送信先 | 通信可否 |
      | hnd01  | hnd02  | O        |
      | hnd01  | nrt01  | O        |
      | hnd01  | nrt02  | O        |
      | hnd02  | hnd01  | O        |
      | hnd02  | nrt01  | O        |
      | hnd02  | nrt02  | O        |
      | nrt01  | hnd01  | O        |
      | nrt01  | hnd02  | O        |
      | nrt01  | nrt02  | O        |
      | nrt02  | hnd01  | O        |
      | nrt02  | hnd02  | O        |
      | nrt02  | nrt01  | O        |
    When 通信要件どおりに ping
    Then 通信要件どおりに ping 成功

