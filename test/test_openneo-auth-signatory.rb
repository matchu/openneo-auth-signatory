require 'helper'

class TestOpenneoAuthSignatory < Test::Unit::TestCase
  def setup
    @signatory = OpenneoAuthSignatory.new('MySecret32!!')
  end
  
  def test_sign
    assert_signature(
      '405f4c596ae21770ca6a304ff34f45e11c496fb7bc1d23abb58663719e061fb3',
      :foo => 'bar', :eggs => 'spam', :your => 'mom'
    )
  end
  
  def test_order_insensitive
    signature = '3e105d0690d99e3c9046b393e9bc338301a69d710756a5a5cfc3872b1ca7bb36'
    assert_signature signature, :a => 1, :b => 2, :c => 3
    assert_signature signature, :c => 3, :b => 2, :a => 1
  end
end
