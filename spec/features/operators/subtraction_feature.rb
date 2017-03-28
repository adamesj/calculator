require 'rails_helper'

describe "performing subtraction functions", :type => :feature, :js => true do

  it "subtracts two positive numbers" do
    visit root_path

    find('.button_6').click
    click_operator('-')
    find('.button_2').click
    find('.equals').click

    expect('#input').to have_content '4'
  end

  it "subtracts two negative numbers" do
    visit root_path

    click_operator('-')
    find('.button_6').click
    click_operator('-')
    click_operator('-')
    find('.button_2').click
    find('.equals').click

    expect('#input').to have_content '-6-2'
  end

  it "uses parentheses symbols when subtracting numbers" do
    visit root_path

    find('.symbol_(').click
    find('.button_9').click
    find('.symbol_)').click
    click_operator('-')
    find('.symbol_(').click
    find('.button_5').click
    find('.symbol_)').click

    expect('#input').to have_content '4'
  end

  it "uses two operators in a calculation" do
    visit root_path

    find('.button_5').click
    click_operator('-')
    click_operator('-')
    find('.button_3').click

    expect('#input').to have_content '5-3'
  end
end

def click_operator(op)
  all(".operator").each do |operator|
    operator.click if operator.text == op
  end
end