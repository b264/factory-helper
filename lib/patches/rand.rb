module FactoryHelper
  module MonkeyPatch
    module Kernel
      def rand(*args)
        return 1
        # p "args: #{args}"
        # if args.length == 1
        #   arg = args[0]
        #   if arg.is_a? Integer
        #     return [0, 1, 2, arg-3, arg-2, arg-1].sample
        #   elsif arg.is_a? Range
        #     return_from_array(arg.to_a)
        #   end
        # else
        #   return edgify_array(arg)
        # end
      end
    end

    private

    def edgify_array(array)
      [array[0], array[1], array[-2], array[-1]]
    end
  end
end
