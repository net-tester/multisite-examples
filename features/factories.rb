# coding: utf-8
# frozen_string_literal: true

FactoryGirl.define do

  sequence :virtual_port_number, 2

  trait :hnd0 do
    tester_set_name 'hnd0'
    netmask '255.255.255.240'
    virtual_port_number
    gateway '198.51.100.100'
  end

  factory :hnd01, class: TestNode do
    name 'hnd01'
    hnd0
    ip_address '198.51.100.101'
    physical_port_number 2
    mac_address '00:00:5e:00:53:01'
  end

  factory :hnd02, class: TestNode do
    name 'hnd02'
    hnd0
    ip_address '198.51.100.102'
    physical_port_number 3
    mac_address '00:00:5e:00:53:02'
  end

  trait :nrt0 do
    tester_set_name 'nrt0'
    netmask '255.255.255.240'
    virtual_port_number
    gateway '198.51.100.100'
  end

  factory :nrt01, class: TestNode do
    name 'nrt01'
    nrt0
    ip_address '198.51.100.103'
    physical_port_number 2
    mac_address '00:00:5e:00:53:03'
  end

  factory :nrt02, class: TestNode do
    name 'nrt02'
    nrt0
    ip_address '198.51.100.104'
    physical_port_number 3
    mac_address '00:00:5e:00:53:04'
  end

  trait :cts0 do
    tester_set_name 'cts0'
    netmask '255.255.255.240'
    virtual_port_number
    gateway '198.51.100.100'
  end

  factory :cts01, class: TestNode do
    name 'cts01'
    cts0
    ip_address '198.51.100.105'
    physical_port_number 2
    mac_address '00:00:5e:00:53:05'
  end

  factory :cts02, class: TestNode do
    name 'cts02'
    cts0
    ip_address '198.51.100.106'
    physical_port_number 3
    mac_address '00:00:5e:00:53:06'
  end

  trait :oka0 do
    tester_set_name 'oka0'
    netmask '255.255.255.240'
    virtual_port_number
    gateway '198.51.100.100'
  end

  factory :oka01, class: TestNode do
    name 'oka01'
    oka0
    ip_address '198.51.100.107'
    physical_port_number 2
    mac_address '00:00:5e:00:53:07'
  end

  factory :oka02, class: TestNode do
    name 'oka02'
    oka0
    ip_address '198.51.100.108'
    physical_port_number 3
    mac_address '00:00:5e:00:53:08'
  end

  trait :itm0 do
    tester_set_name 'itm0'
    netmask '255.255.255.240'
    virtual_port_number
    gateway '198.51.100.100'
  end

  factory :itm01, class: TestNode do
    name 'itm01'
    itm0
    ip_address '198.51.100.109'
    physical_port_number 2
    mac_address '00:00:5e:00:53:09'
  end

  factory :itm02, class: TestNode do
    name 'itm02'
    itm0
    ip_address '198.51.100.110'
    physical_port_number 3
    mac_address '00:00:5e:00:53:0a'
  end

  trait :kix0 do
    tester_set_name 'kix0'
    netmask '255.255.255.240'
    virtual_port_number
    gateway '198.51.100.100'
  end

  factory :kix01, class: TestNode do
    name 'kix01'
    kix0
    ip_address '198.51.100.111'
    physical_port_number 2
    mac_address '00:00:5e:00:53:0b'
  end

  factory :kix02, class: TestNode do
    name 'kix02'
    kix0
    ip_address '198.51.100.112'
    physical_port_number 3
    mac_address '00:00:5e:00:53:0c'
  end

end
