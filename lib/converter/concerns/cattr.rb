class Class
  def cattr( *syms )
    writers, readers = syms.flatten.partition{ |a| a.to_s =~ /=$/ }
    writers = writers.collect{ |e| e.to_s.chomp('=').to_sym }
    readers.concat( writers ) # writers also get readers
    cattr_writer( *writers )
    cattr_reader( *readers )
    return readers + writers
  end

  def cattr_reader( *syms )
    syms.flatten.each do |sym|
      class_eval(<<-EOS, __FILE__, __LINE__)
        unless defined? @@#{sym}
          @@#{sym} = nil
        end
        def self.#{sym}
          @@#{sym}
        end
        def #{sym}
          @@#{sym}
        end
      EOS
    end
    return syms
  end

  def cattr_writer(*syms)
    syms.flatten.each do |sym|
      class_eval(<<-EOS, __FILE__, __LINE__)
        unless defined? @@#{sym}
          @@#{sym} = nil
        end
        def self.#{sym}=(obj)
          @@#{sym} = obj
        end
        def #{sym}=(obj)
          @@#{sym}=(obj)
        end
      EOS
    end
    return syms
  end

  def cattr_accessor(*syms)
    cattr_reader(*syms) + cattr_writer(*syms)
  end
end
