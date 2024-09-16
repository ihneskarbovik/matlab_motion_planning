function [time_cost, local_distance_cost] = calculate_cost(start, goal, pose, velocity)
%%
% @file: calculate_distance.m
% @breif: calculate time and distance cost of trajectory
% @author: Myrthe
% @update: 2024.09.16

distance = calculate_distance(start, goal, pose);
local_distance_cost = sum(distance);

if length(distance) > length(velocity)
    distance = [distance(1:length(velocity),:)];
end
time = distance ./ velocity;
time_cost = sum(time);



end

function distance = calculate_distance(start, goal, pose)
%%
% @file: calculate_distance.m
% @breif: calculate distance of trajectory
% @author: Myrthe
% @update: 2024.09.13

    pose_2d = pose(:, 1:2);
    distance = [];

    if norm(pose_2d(1, :) - start(1:2)) ~= 0
        pose_2d = [start(1:2); pose_2d];
    end

    if pose_2d(end, :) ~= goal(1:2)
        pose_2d = [pose_2d; goal(1:2)];
    end

    for i = 1:(length(pose_2d) - 1)
        d = norm(pose_2d(i, :) - pose_2d(i + 1, :));
        distance = [distance; d];
    end

end


