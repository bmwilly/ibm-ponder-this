using Gadfly

function play_game(players)
  minute = 0
  playing = true
  while playing
    minute += 5

    if minute > 60
      playing = false
      break
    end

    round_players,out_player = select_players(players)

    if round_players[1] == round_players[2]
      playing = false
      break
    end

    sort!(round_players)
    round_players[2] -= round_players[1]
    round_players[1] *= 2
    players = vcat(round_players, out_player)
    sort!(players)
  end
  minute
end

function select_players(players)
  r = rand(1:3)
  out = players[r]
  round_players = copy(players)
  deleteat!(round_players, r)
  round_players,out
end

function select_players(players, r)
  sort!(players)
  out = players[r]
  round_players = copy(players)
  deleteat!(round_players, r)
  round_players,out
end  

function simulate_games(players, ngames)
  times = Int[]
  for game in 1:ngames
    minute = play_game(players)
    push!(times, minute)
  end
  times
end

# mintime = 0
# tic()
# for i = 1:100
#   for j = i+1:100
#     for k = j+1:100
#       players = [i,j,k]
#       times = simulate_games(players, 100)
#       if minimum(times) >= mintime
#         mintime = minimum(times)
#         answer = [i,j,k]
#       end
#     end
#   end
# end
# toc()

ngames = 1000
answer = [1, int(255/2), 255]
times = simulate_games(answer, ngames)
println("players: $(answer)")
println("min time: $(minimum(times))")
plot(x = times, Geom.histogram)
