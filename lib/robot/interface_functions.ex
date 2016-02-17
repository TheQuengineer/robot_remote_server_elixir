defmodule Robot.InterfaceFunctions do
  @moduledoc """
  These are the public interface functions required by robot Framework
  while writing a remote server.

  These Functions will utilize XML-RPC so that the Robot Framework can invoke
  Elixir based Keywords. In order for this to work The functions below need to
  be defined.
  """

  def get_keyword_names do
    IO.puts("Im Showing all the keyword names")
  end

  def run_keyword(keyword_name, args \\ []) do
     IO.puts("Im Running Keyword #{inspect(keyword_name)} with ")
  end

  def get_keyword_arguments(name) do
    IO.puts(" I am showing arguements for #{name}")
  end

  @doc """
  Returns doc string of the given keyword/function used by the robot framework

  params: `module`, `keyword_name`

  ##Example
  If you had a module named Foo, and you wanted the docs for function baz
  you would simply
   iex> Robot.InterFaceFunctions.get_keyword_documentation(Foo, baz)
   iex> "Baz Prints 'Baz' to the console"

  If the module doesn't exist, you will get nil
   iex> Robot.InterFaceFunctions.get_keyword_documentation(IM.NotThere, ding)
   iex> nil
  """
  def get_keyword_documentation(module, keyword_name) do
    find_doc_string_for(module, keyword_name)
  end

  defp find_doc_string_for(module, function) do
    functions_in_module = Code.get_docs(module, :docs)
    #{:to_char_list, 1}, 24, :def, [{:atom, [], nil}],
    #"Converts an atom to a char list.\n\nInlined by the compiler.\n\n## Examples\n\n    iex> Atom.to_char_list(:\"An atom\")\n    'An atom'\n\n"}
    # |> Enum.sort()
    # {{_function, _arity}, _line, _kind, _signature, text} = function
    # String.split(text, "\n")
    # |> Enum.at(0)
    #fn({Sting.to_exisiting_atom(keyword_name), _arity })
    String.to
  end
end
