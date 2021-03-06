ExUnit.start()

defmodule TestStats do
  use ExUnit.Case

  test "calculates sum" do
    list = [1, 3, 5, 7, 9]
    assert Stats.sum(list) == 25
  end

  test "calculates count" do
    list = [1, 3, 5, 7, 9]
    assert Stats.count(list) == 5
  end

  test "calculates average" do
    list = [1, 3, 5, 7, 9]
    assert Stats.average(list) == 5
  end
end

defmodule TestStats0 do
  use ExUnit.Case

  describe "Stats on lists of ints" do
    test "calculates sum" do
      list = [1, 3, 5, 7, 9]
      assert Stats.sum(list) == 25
    end

    test "calculates count" do
      list = [1, 3, 5, 7, 9]
      assert Stats.count(list) == 5
    end

    test "calculates average" do
      list = [1, 3, 5, 7, 9]
      assert Stats.average(list) == 5
    end
  end
end

defmodule TestStats1 do
  use ExUnit.Case

  describe "Stats on lists of ints" do

    setup do
      [ list:    [1, 3, 5, 7, 9, 11],
        sum:     36,
        count:   6
      ]
    end

    test "calculates sum", fixture do
      assert Stats.sum(fixture.list) == fixture.sum
    end

    test "calculates count", fixture do
      assert Stats.count(fixture.list) == fixture.count
    end

    test "calculates average", fixture do
      assert Stats.average(fixture.list) == fixture.sum / fixture.count
    end
  end
end