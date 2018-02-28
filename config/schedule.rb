def schedule(num_courses, prerequisites)
    graph = prerequisites.each_with_object({}) do |req, g|
        if g.key?(req[0])
            g[req[0]].push(req[1])
        else
            g[req[0]] = [req[1]]
        end
    end
    p graph
    depth_table = Array.new(num_courses, -1)

    graph.keys.each do |k|
        queue = [k]

        cur_depth = 0
        to_be_visited_count = 1
        next_to_be_visited_count = 0

        next if depth_table[k] > -1

        depth_table[k] = cur_depth

        while queue.any?
            cur = queue.shift

            to_be_visited_count -= 1

            children = graph[cur]

            next if children.nil?

            children.each do |child|
                if depth_table[child] == -1 # unexplored
                    depth_table[child] = cur_depth + 1
                else
                    if depth_table[child] < cur_depth # visited ancestor... CYCLE
                        return false
                    end
                end

                queue.push(child)
            end
            next_to_be_visited_count += children.size

            if to_be_visited_count == 0
                cur_depth += 1
                to_be_visited_count = next_to_be_visited_count
                next_to_be_visited_count = 0
            end
        end
    end

    true    
end

