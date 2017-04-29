function index = threshMSER(mserf,thresh)
    loc1 = mserf.Location;
    loc2 = circshift(loc1,[1,0]);
    dist = sum((loc1-loc2).^2,2);
    index = find(dist>thresh);
end