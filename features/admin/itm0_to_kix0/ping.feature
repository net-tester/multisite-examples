@multi-site @itm0 @kix0
Feature: VLAN 開通確認 (itm0-kix0)

  Backbone チーム担当者として、
  拠点 Provider Edge 間で通信できるかどうか確認したい
  なぜなら、 VLAN 開通設定を間違えることがあるから

  Scenario: VLAN 開設後の ping
    Given 環境変数 VLAN_ID のユーザグループ
      | 拠点 | ノード |
      | itm0 | itm01  |
      | itm0 | itm02  |
      | kix0 | kix01  |
      | kix0 | kix02  |
    And 通信要件表
      | 送信元 | 送信先 | 通信可否 |
      | itm01  | itm02  | O        |
      | itm01  | kix01  | O        |
      | itm01  | kix02  | O        |
      | itm02  | itm01  | O        |
      | itm02  | kix01  | O        |
      | itm02  | kix02  | O        |
      | kix01  | itm01  | O        |
      | kix01  | itm02  | O        |
      | kix01  | kix02  | O        |
      | kix02  | itm01  | O        |
      | kix02  | itm02  | O        |
      | kix02  | kix01  | O        |
    When 通信要件どおりに ping
    Then 通信要件どおりに ping 成功

