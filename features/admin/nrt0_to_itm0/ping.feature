@multi-site @nrt0 @itm0
Feature: VLAN 開通確認 (nrt0-itm0)

  Backbone チーム担当者として、
  拠点 Provider Edge 間で通信できるかどうか確認したい
  なぜなら、 VLAN 開通設定を間違えることがあるから

  Scenario: VLAN 開設後の ping
    Given 環境変数 VLAN_ID のユーザグループ
      | 拠点 | ノード |
      | nrt0 | nrt01  |
      | nrt0 | nrt02  |
      | itm0 | itm01  |
      | itm0 | itm02  |
    And 通信要件表
      | 送信元 | 送信先 | 通信可否 |
      | nrt01  | nrt02  | O        |
      | nrt01  | itm01  | O        |
      | nrt01  | itm02  | O        |
      | nrt02  | nrt01  | O        |
      | nrt02  | itm01  | O        |
      | nrt02  | itm02  | O        |
      | itm01  | nrt01  | O        |
      | itm01  | nrt02  | O        |
      | itm01  | itm02  | O        |
      | itm02  | nrt01  | O        |
      | itm02  | nrt02  | O        |
      | itm02  | itm01  | O        |
    When 通信要件どおりに ping
    Then 通信要件どおりに ping 成功

