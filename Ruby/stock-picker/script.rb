# Returns an array [n, n] representing the best day to buy and sell - the combination of days that gives
# the most profit or, in absence of the possibility of profit, minimizes the loss
# Days are indexed starting from 0
def stock_picker(prices)
  best_days = [nil, nil]
  best_profit_loss = nil # profit_loss can be a negative or positive value. more NEGATIVE is better since we are calculating buy - sell to get this value

  prices.each.with_index do |buy_price, buy_day|
    prices.each.with_index do |sell_price, sell_day|
      if buy_day <= sell_day # day to buy MUST come before or equal to day to sell
        current_days = [buy_day, sell_day]
        current_profit_loss = buy_price - sell_price

        if best_profit_loss == nil || current_profit_loss < best_profit_loss # first time through, populate with whatever the first loop's values are. otherwise, record the new bests if a new best has been found
          best_profit_loss = current_profit_loss
          best_days = current_days
        end
      end
    end
  end

  return best_days
end


prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]

result = stock_picker(prices)
p result