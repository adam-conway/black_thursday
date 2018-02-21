require_relative 'test_helper'
require_relative '../lib/invoice_item'
require_relative '../lib/sales_engine'

class InvoiceItemTest < Minitest::Test
  def setup
    @data = {
      id: 1,
      item_id: 26_351_984,
      invoice_id: 1,
      quantity: 5,
      unit_price: 34_873,
      created_at: '2009-02-07',
      updated_at: '2014-03-15'
    }
    @invoice_item = InvoiceItem.new(@data, 'InvoiceItemRepository pointer')
  end

  def test_it_exists
    assert_instance_of InvoiceItem, @invoice_item
  end

  def test_attributes_set_correctly
    assert_equal 'InvoiceItemRepository pointer', @invoice_item.parent
    assert_equal 1, @invoice_item.id
    assert_equal 26_351_984, @invoice_item.item_id
    assert_equal 1, @invoice_item.invoice_id
    assert_equal 5, @invoice_item.quantity
    assert_equal 34_873, @invoice_item.unit_price
    assert_equal Time.new(2009, 02, 07), @invoice_item.created_at
    assert_equal Time.new(2014, 03, 15), @invoice_item.updated_at
  end

  # def test_finding_merchant_associated_with_invoice
  #   information = { items: './test/fixtures/items_list_truncated.csv',
  #                   merchants: './test/fixtures/merchants_list_truncated.csv',
  #                   invoices: './test/fixtures/invoices_list_truncated.csv' }
  #   sales_engine = SalesEngine.from_csv(information)
  #   invoice = sales_engine.invoices.find_by_id(20)
  #
  #   assert_instance_of Merchant, invoice.merchant
  #   assert_equal 123_361_63, invoice.merchant.id
  # end
end
