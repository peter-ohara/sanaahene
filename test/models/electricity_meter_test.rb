require "test_helper"

class ElectricityMeterTest < ActiveSupport::TestCase

  setup do
    @meter = create(:meter)
  end

  test "shows usage by day" do
    assert_equal(100, create(:electricity_purchase, meter: @meter, happened_at: '2023-02-01 07:00:00', amount: 100).amount_balance)

    assert_equal(30, create(:electricity_balance, meter: @meter, happened_at: '2023-02-01 08:00:00', amount: 70).amount_used)
    assert_equal(32, create(:electricity_balance, meter: @meter, happened_at: '2023-02-02 08:00:00', amount: 38).amount_used)
    assert_equal(29, create(:electricity_balance, meter: @meter, happened_at: '2023-02-03 08:00:00', amount: 9).amount_used)

    assert_equal(109, create(:electricity_purchase, meter: @meter, happened_at: '2023-02-04 07:00:00', amount: 100).amount_balance)
    assert_equal(0, create(:electricity_balance, meter: @meter, happened_at: '2023-02-04 08:00:00', amount: 109).amount_used)

    assert_equal(25, create(:electricity_balance, meter: @meter, happened_at: '2023-02-05 08:00:00', amount: 84).amount_used)
    assert_equal(37, create(:electricity_balance, meter: @meter, happened_at: '2023-02-06 08:00:00', amount: 47).amount_used)
    assert_equal(10, create(:electricity_balance, meter: @meter, happened_at: '2023-02-07 08:00:00', amount: 37).amount_used)

    assert_equal(
      {
        '2023-02-01'.to_date => 30,
        '2023-02-02'.to_date => 32,
        '2023-02-03'.to_date => 29,
        '2023-02-04'.to_date => 0,
        '2023-02-05'.to_date => 25,
        '2023-02-06'.to_date => 37,
        '2023-02-07'.to_date => 10,
      },
      @meter.usage_by_day('2023-02-01'.to_date..'2023-02-07'.to_date)
    )
  end

  test 'shows total_usage' do
    # TODO: Move some of these assertions tests to purchases and balances
    balance1 = create(:electricity_balance, meter: @meter, happened_at: '2023-02-01 07:00:00', amount: 10)
    assert_equal(0, balance1.amount_previous_balance)
    assert_equal(10, balance1.quantity_delta)
    assert_equal(0, balance1.amount_used)
    assert_equal(10, balance1.amount_balance)

    balance2 = create(:electricity_purchase, meter: @meter, happened_at: '2023-02-01 08:00:00', amount: 100)
    assert_equal(10, balance2.amount_previous_balance)
    assert_equal(100, balance2.quantity_delta)
    assert_equal(110, balance2.amount_balance)

    balance3 = create(:electricity_balance, meter: @meter, happened_at: '2023-02-01 09:00:00', amount: 110)
    assert_equal(110, balance3.amount_previous_balance)
    assert_equal(0, balance3.quantity_delta)
    assert_equal(0, balance3.amount_used)
    assert_equal(110, balance3.amount_balance)

    balance4 = create(:electricity_balance, meter: @meter, happened_at: '2023-02-01 10:00:00', amount: 90)
    assert_equal(110, balance4.amount_previous_balance)
    assert_equal(-20, balance4.quantity_delta)
    assert_equal(20, balance4.amount_used)
    assert_equal(90, balance4.amount_balance)

    assert_equal(20, @meter.total_amount_used('2023-02-01'.to_date.beginning_of_day..'2023-02-01'.to_date.end_of_day))
  end
end
