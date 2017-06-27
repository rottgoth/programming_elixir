defmodule Tax do
  def process(tax_rates, orders) do
    for order = [id: _, ship_to: state, net_amount: net_amount] <- orders do
      tax_rate = Keyword.get tax_rates, state, 0
      total_amount = calculate_total(net_amount, tax_rate)
      Keyword.merge order, [total_amount: total_amount]
    end
  end

  defp calculate_total(net_amount, 0), do: net_amount
  defp calculate_total(net_amount, tax_rate) do
    net_amount + (net_amount * tax_rate)
  end
end