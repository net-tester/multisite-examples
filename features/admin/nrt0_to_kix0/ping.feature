@multi-site @nrt0 @kix0
Feature: VLAN 開通確認 (nrt0-kix0)

  Backbone チーム担当者として、
  拠点 Provider Edge 間で通信できるかどうか確認したい
  なぜなら、 VLAN 開通設定を間違えることがあるから

  Scenario: VLAN 開設後の ping
    Given 環境変数 VLAN_ID のユーザグループ
      | 拠点 | ノード |
      | nrt0 | nrt01  |
      | nrt0 | nrt02  |
      | kix0 | kix01  |
      | kix0 | kix02  |
    And 通信要件表
      | 送信元 | 送信先 | 通信可否 |
      | nrt01  | nrt02  | O        |
      | nrt01  | kix01  | O        |
      | nrt01  | kix02  | O        |
      | nrt02  | nrt01  | O        |
      | nrt02  | kix01  | O        |
      | nrt02  | kix02  | O        |
      | kix01  | nrt01  | O        |
      | kix01  | nrt02  | O        |
      | kix01  | kix02  | O        |
      | kix02  | nrt01  | O        |
      | kix02  | nrt02  | O        |
      | kix02  | kix01  | O        |
    When 通信要件どおりに ping
    Then 通信要件どおりに ping 成功

