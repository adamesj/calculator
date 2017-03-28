require 'rails_helper'

describe "performing division functions", :type => :feature, :js => true do

  it "divides two positive numbers" do
    visit root_path

    find('.button_8').click
    click_operator('/')
    find('.button_2').click
    find('.equals').click

    expect('#input').to have_content '4'
  end

  it "divides two negative numbers" do
    visit root_path

    click_operator('-')
    find('.button_2').click
    find('.button_4').click
    click_operator('*')
    click_operator('-')
    find('.button_3').click
    find('.equals').click

    expect('#input').to have_content '8'
  end

  it "uses 0 as the first expression" do
    visit root_path

    find('.button_0').click
    click_operator('/')
    find('.button_2').click
    find('.equals').click

    expect('#input').to have_content '0'
  end

  it "uses 0 as the second expression" do
    visit root_path

    find('.button_6').click
    click_operator('/')
    find('.button_0').click

    expect('#input').to have_content '0'
  end
end

def click_operator(op)
  all(".operator").each do |operator|
    operator.click if operator.text == op
  end
end