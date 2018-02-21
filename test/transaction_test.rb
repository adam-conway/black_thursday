require_relative 'test_helper'
require_relative '../lib/transaction'
require 'time'

class TransactionTest < Minitest::Test
  def setup
    @data = {
      id: 6,
      invoice_id: 8,
      credit_card_number: '4242424242424242',
      credit_card_expiration_date: '0220',
      result: 'success',
      created_at: '2012-02-26 20:56:56 UTC',
      updated_at: '2012-02-26 20:56:56 UTC'
    }
    @transaction = Transaction.new(@data, 'TransactionRepo pointer')
  end

  def test_it_exists
    assert_instance_of Transaction, @transaction
  end

  def test_initializes_with_information_1
    assert_equal 6, @transaction.id
    assert_equal 8, @transaction.invoice_id
    assert_equal '4242424242424242', @transaction.credit_card_number
    assert_equal '0220', @transaction.credit_card_expiration_date
  end

  def test_initializes_with_information_2
    assert_equal 'success', @transaction.result
    assert_equal Time.utc(2012, 0o2, 26, 20, 56, 56), @transaction.created_at
    assert_equal Time.utc(2012, 0o2, 26, 20, 56, 56), @transaction.updated_at
    assert_equal 'TransactionRepo pointer', @transaction.parent
  end

  def test_item_attributes_have_correct_class
    assert_instance_of Time, @transaction.created_at
    assert_instance_of Time, @transaction.updated_at
  end
end