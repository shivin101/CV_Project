function frame = extractFrames(mser)
    location = mser.Location;
    size = mser.Axes;
    size = max(1.6,1/4*sqrt(size(:,1).*size(:,2)));
    orientation = mser.Orientation;
    or = zeros(length(location),1);
    frame=[location,size,or];
end