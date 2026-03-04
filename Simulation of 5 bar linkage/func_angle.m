function theta = angleBetweenVectors(u, v)
    % Calculate the angle in degrees between two vectors
    cosTheta = dot(u, v) / (norm(u) * norm(v));
    theta = acosd(cosTheta);  % Convert to degrees
end
