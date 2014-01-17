# Dieses Programm wird wie folgt in eigene RubyKara Programme
# eingebunden:
# 
#     require "rubykara-kiel.rb"; init self
#
# Danach kann Kara sowohl innerhalb als auch außerhalb selbst
# definierter Funktionen und Prozeduren mit `kara.move`, `@kara.move`
# oder einfach `move` (also ohne vorangestelltes `kara`, oder `@kara`)
# bewegt werden. Auch alle anderen Operationen stehen auf diese drei
# Weisen zur Verfügung.
#
# Außerdem stehen zusätzliche Operationen `leafLeft`, `leafRight`
# und `leafFront` auf diese Weisen zur Verfügung.

def init obj
    obj.instance_variable_set :@kara, @kara

    obj.class.send :define_method, :kara do
        @kara
    end

    [:move, :turnRight, :turnLeft, :putLeaf, :removeLeaf, 
     :treeFront, :treeLeft, :treeRight, :mushroomFront, :onLeaf, 
     :leafFront, :leafLeft, :leafRight
    ].each do |cmd|
        obj.class.send :define_method, cmd do
            @kara.send cmd
        end
    end

    @kara.instance_variable_set :@world, @world
    
    @kara.class.send :define_method, :leafFront do
        leaf_at? "front"
    end

    @kara.class.send :define_method, :leafLeft do
        leaf_at? "left"
    end

    @kara.class.send :define_method, :leafRight do
        leaf_at? "right"
    end

    @kara.class.send :define_method, :leaf_at? do |loc|
        begin
            @world.is_leaf?(*pos_at(loc))
        rescue
            false
        end
    end

    @kara.instance_variable_set :@dirs,["north","west","south","east"]
    @kara.instance_variable_set :@locs,["front","left","back","right"]
    @kara.instance_variable_set :@x_offsets, [0,-1,0,1]
    @kara.instance_variable_set :@y_offsets, [-1,0,1,0]

    @kara.class.send :define_method, :pos_at do |loc|       
        p = position
        to_s =~ /direction\s*=>\s*(\w*)/
        dir = $1

        d = @dirs.index dir
        l = @locs.index loc
        x = p.x + @x_offsets[(d+l) % 4]
        y = p.y + @y_offsets[(d+l) % 4]

        [x,y]
    end

    @kara.class.send :private, :leaf_at?
    @kara.class.send :private, :pos_at
end