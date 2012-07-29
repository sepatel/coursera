class CartesianProduct
  include Enumerable
  def initialize(seqa, seqb)
    @sequence_a = seqa
    @sequence_b = seqb
  end

  def each
    @sequence_a.each {|itema|
      @sequence_b.each {|itemb|
        yield [itema, itemb]
      }
    }
  end
end

