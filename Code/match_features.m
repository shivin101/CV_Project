function features = match_features(mserf1,mserf2,surff1,surff2)
    thresh_euclid=2;
    distthresh = 0.5;
    surfthresh = 3;
    ind1 = threshMSER(mserf1,thresh_euclid);
    ind2 = threshMSER(mserf2,thresh_euclid);
    surff1 = surff1(ind1);
    surff2 = surff2(ind2);
    mserf1 = mserf1(ind1);
    mserf2 = mserf2(ind2);
    sigma = 1;
    surfdist = (pdist2(surff1,surff2).^2);
    eucliddist = pdist2(mserf1.Location,mserf2.Location);
    [val,idx] = sort(surfdist,2);
    accept = zeros(size(idx,1),1)
    for i=1:size(idx)
        if(eucliddist(i,idx(i,1))<distthresh*eucliddist(i,idx(i,2)) & ...
               surfdist(i,idx(i,1))<surfthresh*surfdist(i,idx(i,2)))
            accept(i)=1;
        end
    end
   
    ind = find(accept==1);
    features(:,1)=ind1(ind);
    features(:,2)=ind2(idx(ind,1));
end