@multi-site @nrt0 @oka0
Feature: VLAN 開通確認 (nrt0-oka0)

  Backbone チーム担当者として、
  拠点 Provider Edge 間で通信できるかどうか確認したい
  なぜなら、 VLAN 開通設定を間違えることがあるから

  Scenario: VLAN 開設後の ping
    Given 環境変数 VLAN_ID のユーザグループ
      | 拠点 | ノード |
      | nrt0 | nrt01  |
      | nrt0 | nrt02  |
      | oka0 | oka01  |
      | oka0 | oka02  |
    And 通信要件表
      | 送信元 | 送信先 | 通信可否 |
      | nrt01  | nrt02  | O        |
      | nrt01  | oka01  | O        |
      | nrt01  | oka02  | O        |
      | nrt02  | nrt01  | O        |
      | nrt02  | oka01  | O        |
      | nrt02  | oka02  | O        |
      | oka01  | nrt01  | O        |
      | oka01  | nrt02  | O        |
      | oka01  | oka02  | O        |
      | oka02  | nrt01  | O        |
      | oka02  | nrt02  | O        |
      | oka02  | oka01  | O        |
    When 通信要件どおりに ping
    Then 通信要件どおりに ping 成功

