require 'rails_helper'

describe "performing the order of operations", :type => :feature, :js => true do

  it "follows the order of operations" do
    visit root_path

    find('.symbol_(').click
    find('.button_9').click
    click_operator('-')
    find('.button_2').click
    find('.symbol_)').click
    click_operator('*')
    find('.button_6').click
    find('.equals').click

    expect('#input').to have_content '42'
  end

  def click_operator(op)
    all(".operator").each do |operator|
      operator.click if operator.text == op
    end
  end
end