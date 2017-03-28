require 'rails_helper'

describe "performing the order of operations", :type => :feature, :js => true do

  it "follows the order of operations" do
    visit root_path

    click_symbol('(')
    find('.button_9').click
    click_operator('-')
    find('.button_2').click
    click_symbol(')')
    click_operator('*')
    find('.button_6').click
    find('.equals').click

    expect(find('#input').text).to eq '42'
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
end