require 'colorize' #gem install colorize

class Player
  def get_name()
    print "Enter the name of your character: "
    name = gets.chomp
    @name = name
    return @name
  end
  def get_class()
    player_class = nil
    print "Available classes are:\n1. Cleric\n2. Knight\n3. Rogue\n4. Assassin\n"
    while true
      print "What class do you want to play?: "
      player_class = gets.chomp
      player_class = player_class.downcase
      if ["cleric", "knight", "rogue", "assassin"].include? player_class
        system("clear")
        system("cls")
        return player_class
      end
    end
  end
  def customize_class(class_choice)
    @class_choice = class_choice
    case @class_choice
    when "knight"
      @hp = 100
      @ad = 10
      @def = 20
      @mana = 10
      counter = 10
      while true
        if counter <= 0
          print "You can increment your stats #{counter} times: \n"
          puts "hp: #{@hp}\nad: #{@ad}\ndef: #{@def}\nmana: #{@mana}"
          sleep(5)
          break
        end
        print "You can increment your stats #{counter} times: \n"
        puts "hp: #{@hp}\nad: #{@ad}\ndef: #{@def}\nmana: #{@mana}"
        increment_stat = gets.chomp
        system("clear")
        system("cls")
        case increment_stat
        when "1"
          @hp += 1
          counter -= 1
        when "2"
          @ad += 1
          counter -= 1
        when "3"
          @def += 1
          counter -= 1
        when "4"
          @mana += 1
          counter -= 1
        end
      end
    when "cleric"
      @hp = 150
      @ad = 10
      @def = 10
      @mana = 10
      counter = 10
      while true
        if counter <= 0
          print "You can increment your stats #{counter} times: \n"
          puts "hp: #{@hp}\nad: #{@ad}\ndef: #{@def}\nmana: #{@mana}"
          sleep(5)
          break
        end
        print "You can increment your stats #{counter} times: \n"
        puts "hp: #{@hp}\nad: #{@ad}\ndef: #{@def}\nmana: #{@mana}"
        increment_stat = gets.chomp
        system("clear")
        system("cls")
        case increment_stat
        when "1"
          @hp += 1
          counter -= 1
        when "2"
          @ad += 1
          counter -= 1
        when "3"
          @def += 1
          counter -= 1
        when "4"
          @mana += 1
          counter -= 1
        end
      end
    when "rogue"
      @hp = 75
      @ad = 20
      @def = 10
      @mana = 10
      counter = 10
      while true
        if counter <= 0
          print "You can increment your stats #{counter} times: \n"
          puts "hp: #{@hp}\nad: #{@ad}\ndef: #{@def}\nmana: #{@mana}"
          sleep(5)
          break
        end
        print "You can increment your stats #{counter} times: \n"
        puts "hp: #{@hp}\nad: #{@ad}\ndef: #{@def}\nmana: #{@mana}"
        increment_stat = gets.chomp
        system("clear")
        system("cls")
        case increment_stat
        when "1"
          @hp += 1
          counter -= 1
        when "2"
          @ad += 1
          counter -= 1
        when "3"
          @def += 1
          counter -= 1
        when "4"
          @mana += 1
          counter -= 1
        end
      end
    when "assassin"
      @hp = 75
      @ad = 30
      @def = 0
      @mana = 10
      counter = 10
      while true
        if counter <= 0
          print "You can increment your stats #{counter} times: \n"
          puts "hp: #{@hp}\nad: #{@ad}\ndef: #{@def}\nmana: #{@mana}"
          sleep 2
          break
        end
        print "You can increment your stats #{counter} times: \n"
        puts "hp: #{@hp}\nad: #{@ad}\ndef: #{@def}\nmana: #{@mana}"
        increment_stat = gets.chomp
        system("clear")
        system("cls")
        case increment_stat
        when "1"
          @hp += 1
          counter -= 1
        when "2"
          @ad += 1
          counter -= 1
        when "3"
          puts "You cant increase your defense as an assassin."
        when "4"
          @mana += 1
          counter -= 1
        end
      end
    end
    system("clear")
    system("cls")
  end
  def return_player()
    return @name, @class_choice, @hp, @ad, @def, @mana
  end
end

class Enemy
  def initialize(enemy_hp, enemy_ad, enemy_def)
    @enemy_hp = enemy_hp
    @enemy_ad = enemy_ad
    @enemy_def = enemy_def
  end
  def print_stats_enemy()
    puts @enemy_hp, @enemy_ad, @enemy_def
  end
  def ret_stats_enemy()
    return @enemy_hp, @enemy_ad, @enemy_def
  end
end

class Intro
  def welcome(name, class_choice)
    puts "Welcome #{name} the #{class_choice}."
    sleep 2
    system("clear")
    system("cls")
  end
end

class Fight
  def initialize(player_hp, player_ad, player_def, player_mana, enemy_hp, enemy_ad, enemy_def, p_class)
    @php = player_hp
    @pad = player_ad
    @pdef = player_def
    @pmana = player_mana
    @ehp = enemy_hp
    @ead = enemy_ad
    @edef = enemy_def
    @class = p_class
  end
  def player_spells(puts_spell)
    case @class
    when "knight"
      case puts_spell
      when "block"
        if @pmana >= 2
          @pdef += 3
          system("clear")
          system("cls")
          puts "You have increased your defense by 3, total def: #{@pdef}"
          @pmana -= 2
          sleep 2
        else
          system("clear")
          system("cls")
          puts "You dont have enough mana!"
          sleep 2
        end
      end
    end
  end
  def attack_player()
    damage = @pad - @edef
    crit = damage / @pad
    if damage <= 0
      system("clear")
      system("cls")
      puts "Your attack has been completely blocked."
      sleep 2
    elsif (damage > 0) && (crit > 0.8)
      system("clear")
      system("cls")
      puts "This was a critical strike. You have dealt #{damage} damage.".red
      sleep 2
    elsif damage > 0
      system("clear")
      system("cls")
      puts "You have dealt #{damage} damage."
      sleep 2
    end
    @ehp -= damage
  end
  def attack_enemy()
    damage = @ead - @pdef
    if damage <= 0
      damage = 1
    end
    crit = damage / @ead
    if damage <= 0
      system("clear")
      system("cls")
      puts "The enemy attack has been completely blocked.".green
      sleep 2
    elsif (damage > 0) && (crit > 0.8)
      system("clear")
      system("cls")
      puts "This was a critical strike. You have taken #{damage} damage.".red
      sleep 2
    elsif damage > 0
      system("clear")
      system("cls")
      puts "You have taken #{damage} damage."
      sleep 2
    end
    @php -= damage
  end
  def combat()
    round_counter = 0
    while  true
      puts "Player stats\nhp: #{@php}\nad: #{@pad}\ndef: #{@pdef}\nmana: #{@pmana}"
      puts "\nEnemy stats\nhp: #{@ehp}\nad: #{@ead}\ndef: #{@edef}"
      round_counter += 1
      if round_counter % 2 == 0
        attack_enemy()
      elsif round_counter % 2 == 1
        puts "\nChoose your action: 1. Attack, 2. Block"
        action = gets.chomp
        case action
        when "1"
          attack_player()
        when "2"
          if @pmana >= 2
            player_spells("block")
          end
        end
      end
      if @php <= 0
        puts "You are dead!"
        break
      end
      if @ehp <=   0
        puts "You killed the enemy!"
        break
      end
    end
  end
end

char = Player.new
test_enemy = Enemy.new(100, 30, 5)

stats_enemy = test_enemy.ret_stats_enemy

char.get_name
system("clear")
system("cls")
char.customize_class(char.get_class)

player_character =  char.return_player
#puts player_character[0]

intro = Intro.new

intro.welcome(player_character[0], player_character[1])

fight = Fight.new(player_character[2], player_character[3], player_character[4], player_character[5], stats_enemy[0], stats_enemy[1], stats_enemy[2], player_character[1])
fight.combat
