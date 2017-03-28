require 'rails_helper'

describe "performing multiplication functions", :type => :feature, :js => true do

  it "multiplies two positive numbers" do
    visit root_path

    find('.button_8').click
    click_operator('*')
    find('.button_2').click
    find('.equals').click

    expect('#input').to have_content '16'
  end

  it "multiplies two negative numbers" do
    visit root_path

    click_operator('-')
    find('.button_5').click
    click_operator('*')
    click_operator('-')
    find('.button_3').click
    find('.equals').click

    expect('#input').to have_content '15'
  end

  it "uses 0 as the first expression" do
    visit root_path

    find('.button_0').click
    click_operator('*')
    find('.button_2').click
    find('.equals').click

    expect('#input').to have_content '0'
  end

  it "uses 0 as the second expression" do
    visit root_path

    find('.button_6').click
    click_operator('*')
    find('.button_0').click

    expect('#input').to have_content '0'
  end

  it "uses 1 as the first expression" do
    visit root_path

    find('.button_1').click
    click_operator('*')
    find('.button_7').click

    expect('#input').to have_content '7'
  end

  it "uses 1 as the second expression" do
    visit root_path

    find('.button_7').click
    click_operator('*')
    find('.button_1').click

    expect('#input').to have_content '7'
  end

  it "uses parentheses symbols when multiplying numbers" do
    visit root_path

    find('.symbol_(').click
    find('.button_9').click
    find('.symbol_)').click
    click_operator('*')
    find('.symbol_(').click
    find('.button_5').click
    find('.symbol_)').click

    expect('#input').to have_content '45'
  end

end

def click_operator(op)
  all(".operator").each do |operator|
    operator.click if operator.text == op
  end
end