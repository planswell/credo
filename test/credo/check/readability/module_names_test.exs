defmodule Credo.Check.Readability.ModuleNamesTest do
  use Credo.TestHelper

  @described_check Credo.Check.Readability.ModuleNames

  test "it should NOT report expected code" do
"""
defmodule CredoSampleModule do
end
""" |> to_source_file
    |> refute_issues(@described_check)
  end

  test "it should report a violation" do
"""
defmodule credo_sample_module do
end
""" |> to_source_file
    |> assert_issue(@described_check)
  end

  test "it should report a violation /2" do
"""
defmodule Credo_SampleModule do
end
""" |> to_source_file
    |> assert_issue(@described_check)
  end
end
