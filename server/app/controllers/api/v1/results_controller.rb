class Api::V1::ResultsController < ApplicationController
  protect_from_forgery except: [:index, :create, :show]

  def index
    hs = Result.all
    render :json => hs
  end

  def create
    param = searchParams

    # ids = client.query("select id, word from wikipedia_nodes where word = '#{params[:from]}' or word = '#{params[:to]}'").to_a.map{|record| record['id']}

    # from_id = ids[0]
    # to_id = ids[1]

    chains = Array.new
    ########################
    # chains = awesomeMethod params[:from], params[:to]
    # => [@node, @node, @node]
    chains = [1, 2, 3, 4, 5]
    ########################

    # chains.push(from_id)
    # chains.push(bfs(client, [], [], from_id, to_id))
    # chains.push(to_id)

    result = Result.new
    if result.save
      chains.each do |node|
        result_item = ResultItem.new result_id: result.id, node_id: node
        result_item.save
      end
      render json: result
    else
      render json: result
    end
  end

  def show
    p params
    ri = ResultItem.where(result_id: params['id'])
    render :json => ri
  end

  private
  def searchParams
    params.require(:result).permit(:from, :to)
    from_keyword = '栃木県'
    to_keyword = '地方公共団体'

    from_id = WikipediaNode.find_by(word: from_keyword).id
    to_id = WikipediaNode.find_by(word: to_keyword).id

    if path = bfs(client, open_list=[from_id], check_list=[], to_id, edges=[])
      result = [to_id]
      while to_id
        to_id = path[to_id]
        result.push(to_id)
      end
      puts result.join("->")[0..-3]
    end
  end

  private
  def bfs(client, open_list, check_list=[], to_id, edges)

    from_id = open_list.shift
    # puts "searching...#{from_id}"

    records = WikipediaEdge.where(from_id: 300).map{|record| record.to_id}
    # records = client.query("select to_id from wikipedia_edges where from_id = '#{from_id}'")
    # .to_a.map{|record| record['to_id']}
    # .select{|item| !item.nil?}

    edges += records.map{|to_id| [from_id, to_id]}

    check_list.push from_id
    open_list += records

    # puts "open_list={#{open_list}}"

    if records.include? to_id
      return edges.map{|edge| edge.reverse}.to_h
    else
      return bfs(client, open_list, check_list, to_id, edges)
    end
  end

end
