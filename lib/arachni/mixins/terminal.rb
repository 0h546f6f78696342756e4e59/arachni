=begin
                  Arachni
  Copyright (c) 2010-2012 Tasos "Zapotek" Laskos <tasos.laskos@gmail.com>

  This is free software; you can copy and distribute and modify
  this program under the term of the GPL v2.0 License
  (See LICENSE file for details)

=end

module Arachni

module Mixins


#
# Terminal manipulation methods
#
#
# Driver/demo code
#
#
#        require_relative 'terminal'
#        require_relative 'progress_bar'
#
#        include Terminal
#        include ProgressBar
#
#        # clear the screen
#        clear_screen!
#
#        start_time = Time.now
#
#        MAX = 5000
#        (1..MAX).each {
#            |i|
#
#            # move the cursor to its home, top-left of the screen.
#            move_to_home!
#
#            prog =  i / Float( MAX ) * 100
#
#            reputs "Counting to #{MAX}..."
#            reputs "Progress:   #{prog}%"
#            reputs "Current:    #{i}"
#
#            reputs
#            reprint eta( prog, start_time ) + "    "
#            reputs progress_bar( prog.ceil )
#
#
#            # make sure that everything is sent out on time
#            flush!
#            sleep 0.003
#        }
#
module Terminal

    #
    # Clears the line before printing using 'puts'
    #
    # @param    [String]    str  string to output
    #
    def reputs( str = '' )
        reprint str + "\n"
    end

    #
    # Clears the line before printing
    #
    # @param    [String]    str  string to output
    #
    def reprint( str = '' )
        print restr( str )
    end

    def restr( str = '' )
        "\e[0K" + str
    end

    #
    # Clear the bottom of the screen
    #
    def clear_screen!
        print "\e[2J"
    end

    #
    # Moves cursor top left to its home
    #
    def move_to_home!
        print "\e[H"
    end

    #
    # Flushes the STDOUT buffer
    #
    def flush!
        $stdout.flush
    end

    extend self
end

end
end
