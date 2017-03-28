require 'rails_helper'

describe "performing addition functions", :type => :feature, :js => true do

  it "adds two positive numbers" do
    visit root_path

    find('.button_5').click
    click_operator('+')
    find('.button_2').click
    find('.equals').click

    expect('#input').to have_content '7'
  end


  it "uses 0 as the first expression" do
    visit root_path

    find('.button_0').click
    click_operator('+')
    find('.button_2').click
    find('.equals').click

    expect('#input').to have_content '2'
  end

  it "uses 0 as the second expression" do
    visit root_path

    find('.button_5').click
    click_operator('+')
    find('.button_0').click

    expect('#input').to have_content '5'
  end

  it "uses 1 as the first expression" do
    visit root_path

    find('.button_1').click
    click_operator('+')
    find('.button_8').click

    expect('#input').to have_content '9'
  end

  it "uses 1 as the second expression" do
    visit root_path

    find('.button_7').click
    click_operator('+')
    find('.button_1').click

    expect('#input').to have_content '8'
  end

  it "uses parentheses symbols when adding numbers" do
    visit root_path

    find('.symbol_(').click
    find('.button_3').click
    find('.symbol_)').click
    click_operator('+')
    find('.symbol_(').click
    find('.button_7').click
    find('.symbol_)').click

    expect('#input').to have_content '10'
  end

  it "uses two operators in a calculation" do
    visit root_path

    find('.button_5').click
    click_operator('+')
    click_operator('+')
    find('.button_3').click

    expect('#input').to have_content '5+3'
  end

end

def click_operator(op)
  all(".operator").each do |operator|
    operator.click if operator.text == op
  end
end