# process method from exercise 8 in chapter lists and recursions
defmodule Tax do
  def read_file(filename) do
    file = File.open! filename, [:read]
    headers = process_data_line(IO.read(file, :line))
    Enum.map(IO.stream(file, :line), &(process_row(&1, headers)))
  end

  defp process_data_line(line, formatter) do
    line
    |> String.strip
    |> String.split(",")
    |> Enum.map(formatter)
  end

  defp process_row(line, headers) do
    values = process_data_line(line)
    Enum.zip(headers, values)
  end

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