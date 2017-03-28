require 'rails_helper'

describe "performing subtraction functions", :type => :feature, :js => true do

  it "subtracts two positive numbers" do
    visit root_path

    find('.button_6').click
    click_operator('-')
    find('.button_2').click
    find('.equals').click

    expect(find('#input').text).to eq '4'
  end

  it "should not enter subtraction operator more than once" do
    visit root_path

    click_operator('-')
    find('.button_2').click
    click_operator('-')
    click_operator('-')
    find('.button_3').click

    expect(find('#input').text).not_to eq '-2--3'
  end

  it "uses parentheses symbols when subtracting numbers" do
    visit root_path

    click_symbol('(')
    find('.button_9').click
    click_symbol(')')
    click_operator('-')
    click_symbol('(')
    find('.button_5').click
    click_symbol(')')

    expect(find('#input').text).to eq '4'
  end

  it "uses two operators in a calculation" do
    visit root_path

    find('.button_5').click
    click_operator('-')
    click_operator('-')
    find('.button_3').click

    expect(find('#input').text).to eq '5-3'
  end
end

def click_operator(op)
  all(".operator").each do |operator|
    operator.click if operator.text == op
  end
end

def click_symbol(symbol)
  all(".symbol").each do |symb|
    symb.click if symb.text == symbol
  end
end