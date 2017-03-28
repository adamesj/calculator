require 'rails_helper'

describe "performing multiplication functions", :type => :feature, :js => true do

  it "multiplies two positive numbers" do
    visit root_path

    find('.button_8').click
    click_operator('*')
    find('.button_2').click
    find('.equals').click

    expect(find('#input').text).to eq '16'
  end

  it "multiplies two negative numbers" do
    visit root_path

    click_operator('-')
    find('.button_5').click
    click_operator('*')
    click_operator('-')
    find('.button_3').click
    find('.equals').click

    expect(find('#input').text).to eq '15'
  end

  it "uses 0 as the first expression" do
    visit root_path

    find('.button_0').click
    click_operator('*')
    find('.button_2').click
    find('.equals').click

    expect(find('#input').text).to eq '0'
  end

  it "uses 0 as the second expression" do
    visit root_path

    find('.button_6').click
    click_operator('*')
    find('.button_0').click

    expect(find('#input').text).to eq '0'
  end

  it "uses 1 as the first expression" do
    visit root_path

    find('.button_1').click
    click_operator('*')
    find('.button_7').click

    expect(find('#input').text).to eq '7'
  end

  it "uses 1 as the second expression" do
    visit root_path

    find('.button_7').click
    click_operator('*')
    find('.button_1').click

    expect(find('#input').text).to eq '7'
  end

  it "uses parentheses symbols when multiplying numbers" do
    visit root_path

    click_symbol('(')
    find('.button_9').click
    click_symbol(')')
    click_operator('*')
    click_symbol('(')
    find('.button_5').click
    click_symbol(')')

    expect(find('#input').text).to eq '45'
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