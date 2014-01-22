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
# Außerdem stehen zusätzliche Operationen zur Verfügung, mit denen
# Kara vor und neben sich sehen kann.
#
# Copyright: 2014, Sebastian Fischer (mail@sebfisch.de), CC BY 4.0

def init obj
    obj.instance_variable_set :@kara, @kara

    obj.class.send :define_method, :kara do
        @kara
    end

    [:move, :turn_left, :turn_right,
     :put_leaf, :take_leaf, :remove_leaf,
     :here, :front, :left, :right,
     :leaf, :mushroom, :tree, :nothing,

     :on_leaf?, :leaf_front?, :leaf_left?, :leaf_right?,
     :tree_front?, :tree_left?, :tree_right?,
     :mushroom_front?, :mushroom_left?, :mushroom_right?,

     :turnLeft, :turnRight,
     :putLeaf, :takeLeaf, :removeLeaf,
     :onLeaf, :leafFront, :leafLeft, :leafRight,
     :treeFront, :treeLeft, :treeRight,
     :mushroomFront, :mushroomLeft, :mushroomRight
    ].each do |cmd|
        obj.class.send :define_method, cmd do
            @kara.send cmd
        end
    end

    @kara.instance_variable_set :@world, @world

    @kara.class.send :define_method, :take_leaf do
        remove_leaf
    end

    @kara.class.send :define_method, :takeLeaf do
        take_leaf
    end

    @kara.class.send :define_method, :leaf do
        :leaf
    end

    @kara.class.send :define_method, :tree do
        :tree
    end

    @kara.class.send :define_method, :mushroom do
        :mushroom
    end

    @kara.class.send :define_method, :nothing do
        :nothing
    end

    @kara.class.send :define_method, :here do
        p = position
        item_at [p.x,p.y]
    end

    @kara.class.send :define_method, :front do
        item_at pos_at("front")
    end

    @kara.class.send :define_method, :left do
        item_at pos_at("left")
    end

    @kara.class.send :define_method, :right do
        item_at pos_at("right")
    end

    @kara.class.send :define_method, :on_leaf? do
        here == leaf
    end

    @kara.class.send :define_method, :leaf_front? do
        front == leaf
    end

    @kara.class.send :define_method, :leaf_left? do
        left == leaf
    end

    @kara.class.send :define_method, :leaf_right? do
        right == leaf
    end

    @kara.class.send :define_method, :mushroom_front? do
        front == mushroom
    end

    @kara.class.send :define_method, :mushroom_left? do
        left == mushroom
    end

    @kara.class.send :define_method, :mushroom_right? do
        right == mushroom
    end

    @kara.class.send :define_method, :tree_front? do
        front == tree
    end

    @kara.class.send :define_method, :tree_left? do
        left == tree
    end

    @kara.class.send :define_method, :tree_right? do
        right == tree
    end
    
    @kara.class.send :define_method, :leafFront do
        leaf_front?
    end

    @kara.class.send :define_method, :leafLeft do
        leaf_left?
    end

    @kara.class.send :define_method, :leafRight do
        leaf_right?
    end

    @kara.class.send :define_method, :mushroomFront do
        mushroom_front?
    end

    @kara.class.send :define_method, :mushroomLeft do
        mushroom_left?
    end

    @kara.class.send :define_method, :mushroomRight do
        mushroom_right?
    end

    @kara.class.send :define_method, :treeFront do
        tree_front?
    end

    @kara.class.send :define_method, :treeLeft do
        tree_left?
    end

    @kara.class.send :define_method, :treeRight do
        tree_right?
    end

    @kara.instance_variable_set :@dirs,["north","west","south","east"]
    @kara.instance_variable_set :@locs,["front","left","back","right"]
    @kara.instance_variable_set :@offsets, [0,-1,0,1]

    @kara.class.send :define_method, :pos_at do |loc|       
        p = position
        to_s =~ /direction\s*=>\s*(\w*)/
        dir = $1

        d = @dirs.index dir
        l = @locs.index loc
        x = p.x + @offsets[(d+l) % 4]
        y = p.y + @offsets[(d+l+1) % 4]

        [x,y]
    end

    @kara.class.send :define_method, :item_at do |pos|
        begin
            if @world.is_leaf?(*pos)
                leaf
            elsif @world.is_tree?(*pos)
                tree
            elsif @world.is_mushroom?(*pos)
                mushroom
            else
                nothing
            end
        rescue
            nothing
        end
    end

    @kara.class.send :private, :pos_at
    @kara.class.send :private, :item_at
end
