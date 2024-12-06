%% Cue x Reward (LogRT)


gt_alerting_flanker1 = grpstats(tbl, {'subject_id', 'cue', 'reward'}, {'mean', 'std'}, 'DataVars', {'logRT', 'acc'});

gt_alerting_flanker_group1 = grpstats(gt_alerting_flanker1, {'cue', 'reward'}, {'mean', 'sem'}, 'DataVars', {'mean_logRT', 'mean_acc'});

grp2idx(tbl.subject_id);

Xoff = linspace(-.05,0.05,4)

figure; hold on;
nexttile; hold on;
errorbar(...
    [1:4] + Xoff(1),...
    gt_alerting_flanker_group1.mean_mean_logRT(ismember(gt_alerting_flanker_group1.reward, 'true')),...
    gt_alerting_flanker_group1.sem_mean_logRT(ismember(gt_alerting_flanker_group1.reward, 'true')), '-ob',...
    'MarkerFaceColor', 'b', 'LineWidth', 1)
errorbar(...
    [1:4] + Xoff(2),...
    gt_alerting_flanker_group1.mean_mean_logRT(ismember(gt_alerting_flanker_group1.reward, 'false')),...
    gt_alerting_flanker_group1.sem_mean_logRT(ismember(gt_alerting_flanker_group1.reward, 'false')), '-oc',...
    'MarkerFaceColor', 'c', 'LineWidth', 1)


xlim([0.5,4.5])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'Double', 'Invalid', 'Valid', 'None'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'High', 'Low'})
title('Cues x Rewards (LogRT)')

nexttile; hold on;


gt_engaging_flanker = grpstats(tbl, {'subject_id', 'engaging', 'reward'}, {'mean', 'std'}, 'DataVars', {'logRT'});
gt_engaging_flanker_group = grpstats(gt_engaging_flanker, {'engaging', 'reward'}, {'mean', 'sem'}, 'DataVars', {'mean_logRT'});


xAxis = [1, 2];

errorbar(xAxis, gt_engaging_flanker_group.mean_mean_logRT(...
    ismember(gt_engaging_flanker_group.engaging, [-1, 1])...
    & ismember(gt_engaging_flanker_group.reward, 'true')),...
    gt_engaging_flanker_group.sem_mean_logRT(...
    ismember(gt_engaging_flanker_group.engaging, [-1, 1])...
    & ismember(gt_engaging_flanker_group.reward, 'true')),...
    '-ob', 'MarkerFaceColor', 'b', 'LineWidth', 1)


errorbar(xAxis, gt_engaging_flanker_group.mean_mean_logRT(...
    ismember(gt_engaging_flanker_group.engaging, [-1, 1])...
    & ismember(gt_engaging_flanker_group.reward, 'false')),...
    gt_engaging_flanker_group.sem_mean_logRT(...
    ismember(gt_engaging_flanker_group.engaging, [-1, 1])...
    & ismember(gt_engaging_flanker_group.reward, 'false')),...
    '-oc', 'MarkerFaceColor', 'c', 'LineWidth', 1)


xlim([0,3])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'Double', 'Valid'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'High', 'Low'})
title('Engaging x Rewards (LogRT)')

nexttile; hold on;


gt_alerting_reward = grpstats(tbl, {'subject_id', 'alerting', 'reward'}, {'mean', 'std'}, 'DataVars', {'logRT'});
gt_alerting_reward_group = grpstats(gt_alerting_reward, {'alerting', 'reward'}, {'mean', 'sem'}, 'DataVars', {'mean_logRT'})

xAxis = [1, 2];

errorbar(xAxis, gt_alerting_reward_group.mean_mean_logRT(...
    ismember(gt_alerting_reward_group.alerting, [-1, 1])...
    & ismember(gt_alerting_reward_group.reward, 'true')),...
    gt_alerting_reward_group.sem_mean_logRT(...
    ismember(gt_alerting_reward_group.alerting, [-1, 1])...
    & ismember(gt_alerting_reward_group.reward, 'true')),...
    '-ob', 'MarkerFaceColor', 'b', 'LineWidth', 1)


errorbar(xAxis, gt_alerting_reward_group.mean_mean_logRT(...
    ismember(gt_alerting_reward_group.alerting, [-1, 1])...
    & ismember(gt_alerting_reward_group.reward, 'false')),...
    gt_alerting_reward_group.sem_mean_logRT(...
    ismember(gt_alerting_reward_group.alerting, [-1, 1])...
    & ismember(gt_alerting_reward_group.reward, 'false')),...
    '-oc', 'MarkerFaceColor', 'c', 'LineWidth', 1)


xlim([0,3])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'None', 'Double'})
legend({'High', 'Low'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
title('Alerting x Rewards (LogRT)')

nexttile; hold on;


gt_disengaging_reward = grpstats(tbl, {'subject_id', 'disengaging', 'reward'}, {'mean', 'std'}, 'DataVars', {'logRT'});
gt_disengaging_reward_group = grpstats(gt_disengaging_reward, {'disengaging', 'reward'}, {'mean', 'sem'}, 'DataVars', {'mean_logRT'});

xAxis = [1, 2];

errorbar(xAxis, gt_disengaging_reward_group.mean_mean_logRT(...
    ismember(gt_disengaging_reward_group.disengaging, [1, -1])...
    & ismember(gt_disengaging_reward_group.reward, 'true')),...
    gt_disengaging_reward_group.sem_mean_logRT(...
    ismember(gt_disengaging_reward_group.disengaging, [1, -1])...
    & ismember(gt_disengaging_reward_group.reward, 'true')),...
    '-ob', 'MarkerFaceColor', 'b', 'LineWidth', 1)

errorbar(xAxis, gt_disengaging_reward_group.mean_mean_logRT(...
    ismember(gt_disengaging_reward_group.disengaging, [1, -1])...
    & ismember(gt_disengaging_reward_group.reward, 'false')),...
    gt_disengaging_reward_group.sem_mean_logRT(...
    ismember(gt_disengaging_reward_group.disengaging, [-1, 1])...
    & ismember(gt_disengaging_reward_group.reward, 'false')),...
    '-oc', 'MarkerFaceColor', 'c', 'LineWidth', 1)


xlim([0,3])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'Valid', 'Invalid'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'High', 'Low'})
title('Disengaging x Rewards (LogRT)')

%% Cue x Reward (Acc)


gt_alerting_flanker1 = grpstats(tbl, {'subject_id', 'cue', 'reward'}, {'mean', 'std'}, 'DataVars', {'acc'});

gt_alerting_flanker_group1 = grpstats(gt_alerting_flanker1, {'cue', 'reward'}, {'mean', 'sem'}, 'DataVars', {'mean_acc'});

grp2idx(tbl.subject_id);

Xoff = linspace(-.05,0.05,4)

figure; hold on;
nexttile; hold on;
errorbar(...
    [1:4] + Xoff(1),...
    gt_alerting_flanker_group1.mean_mean_acc(ismember(gt_alerting_flanker_group1.reward, 'true')),...
    gt_alerting_flanker_group1.sem_mean_acc(ismember(gt_alerting_flanker_group1.reward, 'true')), '-ob',...
    'MarkerFaceColor', 'b', 'LineWidth', 1)
errorbar(...
    [1:4] + Xoff(2),...
    gt_alerting_flanker_group1.mean_mean_acc(ismember(gt_alerting_flanker_group1.reward, 'false')),...
    gt_alerting_flanker_group1.sem_mean_acc(ismember(gt_alerting_flanker_group1.reward, 'false')), '-oc',...
    'MarkerFaceColor', 'c', 'LineWidth', 1)


xlim([0.5,4.5])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'Double', 'Invalid', 'Valid', 'None'})
legend({'High', 'Low'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
title('Cues x Rewards (Acc)')

nexttile; hold on;


gt_engaging_flanker = grpstats(tbl, {'subject_id', 'engaging', 'reward'}, {'mean', 'std'}, 'DataVars', {'acc'})
gt_engaging_flanker_group = grpstats(gt_engaging_flanker, {'engaging', 'reward'}, {'mean', 'sem'}, 'DataVars', {'mean_acc'})


xAxis = [1, 2];

errorbar(xAxis, gt_engaging_flanker_group.mean_mean_acc(...
    ismember(gt_engaging_flanker_group.engaging, [-1, 1])...
    & ismember(gt_engaging_flanker_group.reward, 'true')),...
    gt_engaging_flanker_group.sem_mean_acc(...
    ismember(gt_engaging_flanker_group.engaging, [-1, 1])...
    & ismember(gt_engaging_flanker_group.reward, 'true')),...
    '-ob', 'MarkerFaceColor', 'b', 'LineWidth', 1)

errorbar(xAxis, gt_engaging_flanker_group.mean_mean_acc(...
    ismember(gt_engaging_flanker_group.engaging, [-1, 1])...
    & ismember(gt_engaging_flanker_group.reward, 'false')),...
    gt_engaging_flanker_group.sem_mean_acc(...
    ismember(gt_engaging_flanker_group.engaging, [-1, 1])...
    & ismember(gt_engaging_flanker_group.reward, 'false')),...
    '-oc', 'MarkerFaceColor', 'c', 'LineWidth', 1)

xlim([0,3])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'Double', 'Valid'})
legend({'High', 'Low'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
title('Engaging x Rewards (Acc)')

nexttile; hold on;


gt_alerting_reward = grpstats(tbl, {'subject_id', 'alerting', 'reward'}, {'mean', 'std'}, 'DataVars', {'acc'})
gt_alerting_reward_group = grpstats(gt_alerting_reward, {'alerting', 'reward'}, {'mean', 'sem'}, 'DataVars', {'mean_acc'})

xAxis = [1, 2];


errorbar(xAxis, gt_alerting_reward_group.mean_mean_acc(...
    ismember(gt_alerting_reward_group.alerting, [-1, 1])...
    & ismember(gt_alerting_reward_group.reward, 'true')),...
    gt_alerting_reward_group.sem_mean_acc(...
    ismember(gt_alerting_reward_group.alerting, [-1, 1])...
    & ismember(gt_alerting_reward_group.reward, 'true')),...
    '-ob', 'MarkerFaceColor', 'b', 'LineWidth', 1)
errorbar(xAxis, gt_alerting_reward_group.mean_mean_acc(...
    ismember(gt_alerting_reward_group.alerting, [-1, 1])...
    & ismember(gt_alerting_reward_group.reward, 'false')),...
    gt_alerting_reward_group.sem_mean_acc(...
    ismember(gt_alerting_reward_group.alerting, [-1, 1])...
    & ismember(gt_alerting_reward_group.reward, 'false')),...
    '-oc', 'MarkerFaceColor', 'c', 'LineWidth', 1)


xlim([0,3])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'None', 'Double'})
legend({'High', 'Low'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
title('Alerting x Rewards (Acc)')

nexttile; hold on;


gt_disengaging_reward = grpstats(tbl, {'subject_id', 'disengaging', 'reward'}, {'mean', 'std'}, 'DataVars', {'acc'})
gt_disengaging_reward_group = grpstats(gt_disengaging_reward, {'disengaging', 'reward'}, {'mean', 'sem'}, 'DataVars', {'mean_acc'})

xAxis = [1, 2];


errorbar(xAxis, gt_disengaging_reward_group.mean_mean_acc(...
    ismember(gt_disengaging_reward_group.disengaging, [1, -1])...
    & ismember(gt_disengaging_reward_group.reward, 'true')),...
    gt_disengaging_reward_group.sem_mean_acc(...
    ismember(gt_disengaging_reward_group.disengaging, [1, -1])...
    & ismember(gt_disengaging_reward_group.reward, 'true')),...
    '-ob', 'MarkerFaceColor', 'b', 'LineWidth', 1)


errorbar(xAxis, gt_disengaging_reward_group.mean_mean_acc(...
    ismember(gt_disengaging_reward_group.disengaging, [1, -1])...
    & ismember(gt_disengaging_reward_group.reward, 'false')),...
    gt_disengaging_reward_group.sem_mean_acc(...
    ismember(gt_disengaging_reward_group.disengaging, [-1, 1])...
    & ismember(gt_disengaging_reward_group.reward, 'false')),...
    '-oc', 'MarkerFaceColor', 'c', 'LineWidth', 1)

xlim([0,3])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'Valid', 'Invalid'})
legend({'High', 'Low'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
title('Disengaging x Rewards (Acc)')


%% flanker x reward (Acc)

gt_alerting_flanker = grpstats(tbl, {'subject_id', 'flanker_congruency', 'reward'}, {'mean', 'std'}, 'DataVars', {'acc'})

gt_alerting_flanker_group = grpstats(gt_alerting_flanker, {'flanker_congruency','reward'}, {'mean', 'sem'}, 'DataVars', {'mean_acc'})

figure; hold on;

errorbar(xAxis, gt_alerting_flanker_group.mean_mean_acc(...
    ismember(gt_alerting_flanker_group.flanker_congruency, {'congruent', 'incongruent'})&...
    ismember(gt_alerting_flanker_group.reward, 'true')),...
    gt_alerting_flanker_group.sem_mean_acc(...
    ismember(gt_alerting_flanker_group.flanker_congruency, {'congruent', 'incongruent'})&...
    ismember(gt_alerting_flanker_group.reward, 'true' )),...
    '-ob', 'MarkerFaceColor', 'b', 'LineWidth', 1)

xAxis = [1, 2];
errorbar(xAxis, gt_alerting_flanker_group.mean_mean_acc(...
    ismember(gt_alerting_flanker_group.flanker_congruency, {'congruent', 'incongruent'})&...
    ismember(gt_alerting_flanker_group.reward, 'false')),...
    gt_alerting_flanker_group.sem_mean_acc(...
    ismember(gt_alerting_flanker_group.flanker_congruency, {'congruent', 'incongruent'})&...
    ismember(gt_alerting_flanker_group.reward, 'false')),...
    '-oc', 'MarkerFaceColor', 'c', 'LineWidth', 1)



xlim([0, 3])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'Congruent', 'Incongruent'})
legend({'High', 'Low'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)

title('Flanker x Rewards (Acc)')

%% flanker x reward (LogRT)

gt_alerting_flanker = grpstats(tbl, {'subject_id', 'flanker_congruency', 'reward'}, {'mean', 'std'}, 'DataVars', {'logRT'})

gt_alerting_flanker_group = grpstats(gt_alerting_flanker, {'flanker_congruency','reward'}, {'mean', 'sem'}, 'DataVars', {'mean_logRT'})

figure; hold on;

errorbar(xAxis, gt_alerting_flanker_group.mean_mean_logRT(...
    ismember(gt_alerting_flanker_group.flanker_congruency, {'congruent', 'incongruent'})&...
    ismember(gt_alerting_flanker_group.reward, 'true')),...
    gt_alerting_flanker_group.sem_mean_logRT(...
    ismember(gt_alerting_flanker_group.flanker_congruency, {'congruent', 'incongruent'})&...
    ismember(gt_alerting_flanker_group.reward, 'true' )),...
    '-ob', 'MarkerFaceColor', 'b', 'LineWidth', 1)

xAxis = [1, 2];
errorbar(xAxis, gt_alerting_flanker_group.mean_mean_logRT(...
    ismember(gt_alerting_flanker_group.flanker_congruency, {'congruent', 'incongruent'})&...
    ismember(gt_alerting_flanker_group.reward, 'false')),...
    gt_alerting_flanker_group.sem_mean_logRT(...
    ismember(gt_alerting_flanker_group.flanker_congruency, {'congruent', 'incongruent'})&...
    ismember(gt_alerting_flanker_group.reward, 'false')),...
    '-oc', 'MarkerFaceColor', 'c', 'LineWidth', 1)



xlim([0, 3])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'Congruent', 'Incongruent'})
legend({'High', 'Low'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)

title('Flanker x Rewards (LogRT)')

%% flanker x reward (RT)

gt_alerting_flanker = grpstats(tbl, {'subject_id', 'flanker_congruency', 'reward'}, {'mean', 'std'}, 'DataVars', {'rt'})

gt_alerting_flanker_group = grpstats(gt_alerting_flanker, {'flanker_congruency','reward'}, {'mean', 'sem'}, 'DataVars', {'mean_rt'})

figure; hold on;

errorbar(xAxis, gt_alerting_flanker_group.mean_mean_rt(...
    ismember(gt_alerting_flanker_group.flanker_congruency, {'congruent', 'incongruent'})&...
    ismember(gt_alerting_flanker_group.reward, 'true')),...
    gt_alerting_flanker_group.sem_mean_rt(...
    ismember(gt_alerting_flanker_group.flanker_congruency, {'congruent', 'incongruent'})&...
    ismember(gt_alerting_flanker_group.reward, 'true' )),...
    '-ob', 'MarkerFaceColor', 'b', 'LineWidth', 1)

xAxis = [1, 2];
errorbar(xAxis, gt_alerting_flanker_group.mean_mean_rt(...
    ismember(gt_alerting_flanker_group.flanker_congruency, {'congruent', 'incongruent'})&...
    ismember(gt_alerting_flanker_group.reward, 'false')),...
    gt_alerting_flanker_group.sem_mean_rt(...
    ismember(gt_alerting_flanker_group.flanker_congruency, {'congruent', 'incongruent'})&...
    ismember(gt_alerting_flanker_group.reward, 'false')),...
    '-oc', 'MarkerFaceColor', 'c', 'LineWidth', 1)



xlim([0, 3])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'Congruent', 'Incongruent'})
legend({'High', 'Low'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)

title('Flanker x Rewards (RT)')
%% Main Effect/Difference Effect/RT

gt_alerting_flanker1 = grpstats(tbl, {'subject_id', 'cue', 'reward'}, {'mean', 'std'}, 'DataVars', {'logRT', 'rt' 'acc'});

gt_alerting_flanker_group1 = grpstats(gt_alerting_flanker1, {'cue', 'reward'}, {'mean', 'sem'}, 'DataVars', {'mean_rt', 'mean_acc'});

grp2idx(tbl.subject_id);

Xoff = linspace(-.05,0.05,4)

figure; hold on;
nexttile; hold on;
errorbar(...
    [1:4] + Xoff(1),...
    gt_alerting_flanker_group1.mean_mean_rt(ismember(gt_alerting_flanker_group1.reward, 'true')),...
    gt_alerting_flanker_group1.sem_mean_rt(ismember(gt_alerting_flanker_group1.reward, 'true')), '-ob',...
    'MarkerFaceColor', 'b', 'LineWidth', 1)
errorbar(...
    [1:4] + Xoff(2),...
    gt_alerting_flanker_group1.mean_mean_rt(ismember(gt_alerting_flanker_group1.reward, 'false')),...
    gt_alerting_flanker_group1.sem_mean_rt(ismember(gt_alerting_flanker_group1.reward, 'false')), '-oc',...
    'MarkerFaceColor', 'c', 'LineWidth', 1)


xlim([0.5,4.5])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'Double', 'Invalid', 'Valid', 'None'})
ylabel('Milliseconds')
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'High', 'Low'})
title('Cues x Rewards (RT)')

nexttile; hold on;

gt_cue_subject = grpstats(tbl, {'subject_id', 'cue', 'reward'}, {'mean', 'std'}, 'DataVars', {'logRT', 'rt', 'acc'})
rt_alerting_high_reward_mean = mean(gt_cue_subject.mean_rt(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'true') - gt_cue_subject.mean_rt(gt_cue_subject.cue == "None" & gt_cue_subject.reward == 'true'))
rt_alerting_high_reward_sem = std(gt_cue_subject.mean_rt(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'true') - gt_cue_subject.mean_rt(gt_cue_subject.cue == "None" & gt_cue_subject.reward == 'true'))/sqrt(117)

rt_alerting_low_reward_mean = mean(gt_cue_subject.mean_rt(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'false') - gt_cue_subject.mean_rt(gt_cue_subject.cue == "None" & gt_cue_subject.reward == 'false'))
rt_alerting_low_reward_sem = std(gt_cue_subject.mean_rt(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'false') - gt_cue_subject.mean_rt(gt_cue_subject.cue == "None" & gt_cue_subject.reward == 'false'))/sqrt(117)


rt_engaging_high_reward_mean = mean(gt_cue_subject.mean_rt(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'true') - gt_cue_subject.mean_rt(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'true'))
rt_engaging_high_reward_sem = std(gt_cue_subject.mean_rt(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'true') - gt_cue_subject.mean_rt(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'true'))/sqrt(117)

rt_engaging_low_reward_mean = mean(gt_cue_subject.mean_rt(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'false') - gt_cue_subject.mean_rt(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'false'))
rt_engaging_low_reward_sem = std(gt_cue_subject.mean_rt(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'false') - gt_cue_subject.mean_rt(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'false'))/sqrt(117)


rt_disengaging_high_reward_mean = mean(gt_cue_subject.mean_rt(gt_cue_subject.cue == "Spatial invalid" & gt_cue_subject.reward == 'true') - gt_cue_subject.mean_rt(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'true'))
rt_disengaging_high_reward_sem = std(gt_cue_subject.mean_rt(gt_cue_subject.cue == "Spatial invalid" & gt_cue_subject.reward == 'true') - gt_cue_subject.mean_rt(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'true'))/sqrt(117)

rt_disengaging_low_reward_mean = mean(gt_cue_subject.mean_rt(gt_cue_subject.cue == "Spatial invalid" & gt_cue_subject.reward == 'false') - gt_cue_subject.mean_rt(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'false'))
rt_disengaging_low_reward_sem = std(gt_cue_subject.mean_rt(gt_cue_subject.cue == "Spatial invalid" & gt_cue_subject.reward == 'false') - gt_cue_subject.mean_rt(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'false'))/sqrt(117)



errorbar(...
    [1:1] + Xoff(1),...
    rt_alerting_high_reward_mean, rt_alerting_high_reward_sem, '-ob',...
    'MarkerFaceColor', 'b', 'LineWidth', 1)
errorbar(...
    [1:1],...
    rt_alerting_low_reward_mean, rt_alerting_low_reward_sem, '-oc',...
    'MarkerFaceColor', 'c', 'LineWidth', 1)

xlim([0.7,1.3])
ylim([-43,-22])
ylabel('Milliseconds')
xticks([1:1])
xticklabels({'Alerting'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'High', 'Low'})
title('Alerting x Rewards (RT)')

nexttile; hold on;

errorbar(...
    [1:1] + Xoff(1),...
    rt_engaging_high_reward_mean, rt_engaging_high_reward_sem, '-ob',...
    'MarkerFaceColor', 'b', 'LineWidth', 1)
errorbar(...
    [1:1],...
    rt_engaging_low_reward_mean, rt_engaging_low_reward_sem, '-oc',...
    'MarkerFaceColor', 'c', 'LineWidth', 1)

xlim([0.7,1.3])
xticks([1:1])
ylabel('Milliseconds')
xticklabels({'Engaging'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'High', 'Low'})
title('Engaging x Rewards (RT)')

nexttile; hold on;

errorbar(...
    [1:1] + Xoff(1),...
    rt_disengaging_high_reward_mean, rt_disengaging_high_reward_sem, '-ob',...
    'MarkerFaceColor', 'b', 'LineWidth', 1)
errorbar(...
    [1:1],...
    rt_disengaging_low_reward_mean, rt_disengaging_low_reward_sem, '-oc',...
    'MarkerFaceColor', 'c', 'LineWidth', 1)

xlim([0.7,1.3])
xticks([1:1])
ylabel('Milliseconds')
xticklabels({'Disengaging'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'High', 'Low'})
title('Disengaging x Rewards (RT)')



%% Main Effect/Difference Effect/LogRT

gt_alerting_flanker1 = grpstats(tbl, {'subject_id', 'cue', 'reward'}, {'mean', 'std'}, 'DataVars', {'logRT', 'rt' 'acc'});

gt_alerting_flanker_group1 = grpstats(gt_alerting_flanker1, {'cue', 'reward'}, {'mean', 'sem'}, 'DataVars', {'mean_logRT','mean_rt', 'mean_acc'});

grp2idx(tbl.subject_id);

Xoff = linspace(-.05,0.05,4)

figure; hold on;
nexttile; hold on;
errorbar(...
    [1:4] + Xoff(1),...
    gt_alerting_flanker_group1.mean_mean_logRT(ismember(gt_alerting_flanker_group1.reward, 'true')),...
    gt_alerting_flanker_group1.sem_mean_logRT(ismember(gt_alerting_flanker_group1.reward, 'true')), '-ob',...
    'MarkerFaceColor', 'b', 'LineWidth', 1)
errorbar(...
    [1:4] + Xoff(2),...
    gt_alerting_flanker_group1.mean_mean_logRT(ismember(gt_alerting_flanker_group1.reward, 'false')),...
    gt_alerting_flanker_group1.sem_mean_logRT(ismember(gt_alerting_flanker_group1.reward, 'false')), '-oc',...
    'MarkerFaceColor', 'c', 'LineWidth', 1)


xlim([0.5,4.5])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'Double', 'Invalid', 'Valid', 'None'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'High', 'Low'})
title('Cues x Rewards (LogRT)')

nexttile; hold on;

gt_cue_subject = grpstats(tbl, {'subject_id', 'cue', 'reward'}, {'mean', 'std'}, 'DataVars', {'logRT', 'rt', 'acc'})
logRT_alerting_high_reward_mean = mean(gt_cue_subject.mean_logRT(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'true') - gt_cue_subject.mean_logRT(gt_cue_subject.cue == "None" & gt_cue_subject.reward == 'true'))
logRT_alerting_high_reward_sem = std(gt_cue_subject.mean_logRT(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'true') - gt_cue_subject.mean_logRT(gt_cue_subject.cue == "None" & gt_cue_subject.reward == 'true'))/sqrt(117)

logRT_alerting_low_reward_mean = mean(gt_cue_subject.mean_logRT(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'false') - gt_cue_subject.mean_logRT(gt_cue_subject.cue == "None" & gt_cue_subject.reward == 'false'))
logRT_alerting_low_reward_sem = std(gt_cue_subject.mean_logRT(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'false') - gt_cue_subject.mean_logRT(gt_cue_subject.cue == "None" & gt_cue_subject.reward == 'false'))/sqrt(117)


logRT_engaging_high_reward_mean = mean(gt_cue_subject.mean_logRT(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'true') - gt_cue_subject.mean_logRT(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'true'))
logRT_engaging_high_reward_sem = std(gt_cue_subject.mean_logRT(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'true') - gt_cue_subject.mean_logRT(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'true'))/sqrt(117)

logRT_engaging_low_reward_mean = mean(gt_cue_subject.mean_logRT(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'false') - gt_cue_subject.mean_logRT(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'false'))
logRT_engaging_low_reward_sem = std(gt_cue_subject.mean_logRT(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'false') - gt_cue_subject.mean_logRT(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'false'))/sqrt(117)

logRT_disengaging_high_reward_mean = mean(gt_cue_subject.mean_logRT(gt_cue_subject.cue == "Spatial invalid" & gt_cue_subject.reward == 'true') - gt_cue_subject.mean_logRT(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'true'))
logRT_disengaging_high_reward_sem = std(gt_cue_subject.mean_logRT(gt_cue_subject.cue == "Spatial invalid" & gt_cue_subject.reward == 'true') - gt_cue_subject.mean_logRT(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'true'))/sqrt(117)

logRT_disengaging_low_reward_mean = mean(gt_cue_subject.mean_logRT(gt_cue_subject.cue == "Spatial invalid" & gt_cue_subject.reward == 'false') - gt_cue_subject.mean_logRT(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'false'))
logRT_disengaging_low_reward_sem = std(gt_cue_subject.mean_logRT(gt_cue_subject.cue == "Spatial invalid" & gt_cue_subject.reward == 'false') - gt_cue_subject.mean_logRT(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'false'))/sqrt(117)



errorbar(...
    [1:1] + Xoff(1),...
    logRT_alerting_high_reward_mean, logRT_alerting_high_reward_sem, '-ob',...
    'MarkerFaceColor', 'b', 'LineWidth', 1)
errorbar(...
    [1:1],...
    logRT_alerting_low_reward_mean, logRT_alerting_low_reward_sem, '-oc',...
    'MarkerFaceColor', 'c', 'LineWidth', 1)

xlim([0.7,1.3])
xticks([1:1])
xticklabels({'Alerting'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'High', 'Low'})
title('Alerting x Rewards (LogRT)')

nexttile; hold on;

errorbar(...
    [1:1] + Xoff(1),...
    logRT_engaging_high_reward_mean, logRT_engaging_high_reward_sem, '-ob',...
    'MarkerFaceColor', 'b', 'LineWidth', 1)
errorbar(...
    [1:1],...
    logRT_engaging_low_reward_mean, logRT_engaging_low_reward_sem, '-oc',...
    'MarkerFaceColor', 'c', 'LineWidth', 1)

xlim([0.7,1.3])
xticks([1:1])
xticklabels({'Engaging'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'High', 'Low'})
title('Engaging x Rewards (LogRT)')

nexttile; hold on;

errorbar(...
    [1:1] + Xoff(1),...
    logRT_disengaging_high_reward_mean, logRT_disengaging_high_reward_sem, '-ob',...
    'MarkerFaceColor', 'b', 'LineWidth', 1)
errorbar(...
    [1:1],...
    logRT_disengaging_low_reward_mean, logRT_disengaging_low_reward_sem, '-oc',...
    'MarkerFaceColor', 'c', 'LineWidth', 1)

xlim([0.7,1.3])
xticks([1:1])
xticklabels({'Disengaging'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'High', 'Low'})
title('Disengaging x Rewards (LogRT)')

%% Main Effect/Difference Effect/Acc

gt_alerting_flanker1 = grpstats(tbl, {'subject_id', 'cue', 'reward'}, {'mean', 'std'}, 'DataVars', {'logRT', 'rt' 'acc'});

gt_alerting_flanker_group1 = grpstats(gt_alerting_flanker1, {'cue', 'reward'}, {'mean', 'sem'}, 'DataVars', {'mean_rt', 'mean_acc'});

grp2idx(tbl.subject_id);

Xoff = linspace(-.05,0.05,4)

figure; hold on;
nexttile; hold on;
errorbar(...
    [1:4] + Xoff(1),...
    gt_alerting_flanker_group1.mean_mean_acc(ismember(gt_alerting_flanker_group1.reward, 'true')),...
    gt_alerting_flanker_group1.sem_mean_acc(ismember(gt_alerting_flanker_group1.reward, 'true')), '-ob',...
    'MarkerFaceColor', 'b', 'LineWidth', 1)
errorbar(...
    [1:4] + Xoff(2),...
    gt_alerting_flanker_group1.mean_mean_acc(ismember(gt_alerting_flanker_group1.reward, 'false')),...
    gt_alerting_flanker_group1.sem_mean_acc(ismember(gt_alerting_flanker_group1.reward, 'false')), '-oc',...
    'MarkerFaceColor', 'c', 'LineWidth', 1)


xlim([0.5,4.5])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'Double', 'Invalid', 'Valid', 'None'})
ylabel('Accuracy')
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'High', 'Low'})
title('Cues x Rewards (Acc)')

nexttile; hold on;

gt_cue_subject = grpstats(tbl, {'subject_id', 'cue', 'reward'}, {'mean', 'std'}, 'DataVars', {'logRT', 'rt', 'acc'})
acc_alerting_high_reward_mean = mean(gt_cue_subject.mean_acc(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'true') - gt_cue_subject.mean_acc(gt_cue_subject.cue == "None" & gt_cue_subject.reward == 'true'))
acc_alerting_high_reward_sem = std(gt_cue_subject.mean_acc(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'true') - gt_cue_subject.mean_acc(gt_cue_subject.cue == "None" & gt_cue_subject.reward == 'true'))/sqrt(117)

acc_alerting_low_reward_mean = mean(gt_cue_subject.mean_acc(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'false') - gt_cue_subject.mean_acc(gt_cue_subject.cue == "None" & gt_cue_subject.reward == 'false'))
acc_alerting_low_reward_sem = std(gt_cue_subject.mean_acc(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'false') - gt_cue_subject.mean_acc(gt_cue_subject.cue == "None" & gt_cue_subject.reward == 'false'))/sqrt(117)


acc_engaging_high_reward_mean = mean(gt_cue_subject.mean_acc(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'true') - gt_cue_subject.mean_acc(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'true'))
acc_engaging_high_reward_sem = std(gt_cue_subject.mean_acc(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'true') - gt_cue_subject.mean_acc(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'true'))/sqrt(117)

acc_engaging_low_reward_mean = mean(gt_cue_subject.mean_acc(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'false') - gt_cue_subject.mean_acc(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'false'))
acc_engaging_low_reward_sem = std(gt_cue_subject.mean_acc(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'false') - gt_cue_subject.mean_acc(gt_cue_subject.cue == "Double" & gt_cue_subject.reward == 'false'))/sqrt(117)


acc_disengaging_high_reward_mean = mean(gt_cue_subject.mean_acc(gt_cue_subject.cue == "Spatial invalid" & gt_cue_subject.reward == 'true') - gt_cue_subject.mean_acc(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'true'))
acc_disengaging_high_reward_sem = std(gt_cue_subject.mean_acc(gt_cue_subject.cue == "Spatial invalid" & gt_cue_subject.reward == 'true') - gt_cue_subject.mean_acc(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'true'))/sqrt(117)

acc_disengaging_low_reward_mean = mean(gt_cue_subject.mean_acc(gt_cue_subject.cue == "Spatial invalid" & gt_cue_subject.reward == 'false') - gt_cue_subject.mean_acc(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'false'))
acc_disengaging_low_reward_sem = std(gt_cue_subject.mean_acc(gt_cue_subject.cue == "Spatial invalid" & gt_cue_subject.reward == 'false') - gt_cue_subject.mean_acc(gt_cue_subject.cue == "Spatial valid" & gt_cue_subject.reward == 'false'))/sqrt(117)



errorbar(...
    [1:1] + Xoff(1),...
    acc_alerting_high_reward_mean, acc_alerting_high_reward_sem, '-ob',...
    'MarkerFaceColor', 'b', 'LineWidth', 1)
errorbar(...
    [1:1],...
    acc_alerting_low_reward_mean, acc_alerting_low_reward_sem, '-oc',...
    'MarkerFaceColor', 'c', 'LineWidth', 1)

xlim([0.7,1.3])
xticks([1:1])
ylabel('Accuracy')
xticklabels({'Alerting'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'High', 'Low'})
title('Alerting x Rewards (Acc)')

nexttile; hold on;

errorbar(...
    [1:1] + Xoff(1),...
    acc_engaging_high_reward_mean, acc_engaging_high_reward_sem, '-ob',...
    'MarkerFaceColor', 'b', 'LineWidth', 1)
errorbar(...
    [1:1],...
    acc_engaging_low_reward_mean, acc_engaging_low_reward_sem, '-oc',...
    'MarkerFaceColor', 'c', 'LineWidth', 1)

xlim([0.7,1.3])
xticks([1:1])
ylabel('Accuracy')
xticklabels({'Engaging'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'High', 'Low'})
title('Engaging x Rewards (Acc)')

nexttile; hold on;

errorbar(...
    [1:1] + Xoff(1),...
    acc_disengaging_high_reward_mean, acc_disengaging_high_reward_sem, '-ob',...
    'MarkerFaceColor', 'b', 'LineWidth', 1)
errorbar(...
    [1:1],...
    acc_disengaging_low_reward_mean, acc_disengaging_low_reward_sem, '-oc',...
    'MarkerFaceColor', 'c', 'LineWidth', 1)

xlim([0.7,1.3])
xticks([1:1])
ylabel('Accuracy')
xticklabels({'Disengaging'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'High', 'Low'})
title('Disengaging x Rewards (Acc)')


%% LogRT differences
gt_cue_subject = grpstats(tbl, {'subject_id', 'cue'}, {'mean', 'std'}, 'DataVars', {'logRT', 'rt', 'acc'})
rt_alerting_high_reward_mean = mean(gt_cue_subject.mean_acc(gt_cue_subject.cue == "Spatial invalid") - gt_cue_subject.mean_acc(gt_cue_subject.cue == "Spatial valid"))
rt_alerting_high_reward_sd = std(gt_cue_subject.mean_acc(gt_cue_subject.cue == "Spatial invalid") - gt_cue_subject.mean_acc(gt_cue_subject.cue == "Spatial valid"))
rt_alerting_high_reward_sem = std(gt_cue_subject.mean_acc(gt_cue_subject.cue == "Spatial invalid") - gt_cue_subject.mean_acc(gt_cue_subject.cue == "Spatial valid"))/sqrt(117)


%% LogRT differences
gt_cue_subject = grpstats(tbl, {'subject_id', 'reward'}, {'mean', 'std'}, 'DataVars', {'logRT', 'rt', 'acc'})
rt_alerting_high_reward_mean = mean(gt_cue_subject.mean_rt(gt_cue_subject.flanker_congruency_cat == "congruent") - gt_cue_subject.mean_rt(gt_cue_subject.flanker_congruency_cat == "incongruent"))
rt_alerting_high_reward_sd = std(gt_cue_subject.mean_rt(gt_cue_subject.flanker_congruency_cat == "congruent") - gt_cue_subject.mean_rt(gt_cue_subject.flanker_congruency_cat == "incongruent"))
rt_alerting_high_reward_sd = std(gt_cue_subject.mean_r(gt_cue_subject.flanker_congruency_cat == "congruent") - gt_cue_subject.mean_rt(gt_cue_subject.flanker_congruency_cat == "incongruent"))/sqrt(117)

%% LogRT differences
gt_cue_subject = grpstats(tbl, {'subject_id', 'reward'}, {'mean', 'std'}, 'DataVars', {'logRT', 'rt', 'acc'})
rt_alerting_high_reward_mean = mean(gt_cue_subject.mean_rt(gt_cue_subject.reward == "true") - gt_cue_subject.mean_rt(gt_cue_subject.reward == "false"))
rt_alerting_high_reward_sd = std(gt_cue_subject.mean_rt(gt_cue_subject.reward == "true") - gt_cue_subject.mean_rt(gt_cue_subject.reward == "false"))
rt_alerting_high_reward_sd = std(gt_cue_subject.mean_rt(gt_cue_subject.reward == "true") - gt_cue_subject.mean_rt(gt_cue_subject.reward == "false"))/sqrt(117)

acc_alerting_high_reward_mean = mean(gt_cue_subject.mean_acc(gt_cue_subject.reward == "true") - gt_cue_subject.mean_acc(gt_cue_subject.reward == "false"))
acc_alerting_high_reward_sd = std(gt_cue_subject.mean_acc(gt_cue_subject.reward == "true") - gt_cue_subject.mean_acc(gt_cue_subject.reward == "false"))
acc_alerting_high_reward_sd = std(gt_cue_subject.mean_acc(gt_cue_subject.reward == "true") - gt_cue_subject.mean_acc(gt_cue_subject.reward == "false"))/sqrt(117)


%% Cue x Flanker (RT)


gt_alerting_flanker1 = grpstats(tbl, {'subject_id', 'cue', 'flanker_congruency_cat'}, {'mean', 'std'}, 'DataVars', {'rt', 'acc'});

gt_alerting_flanker_group1 = grpstats(gt_alerting_flanker1, {'cue', 'flanker_congruency_cat'}, {'mean', 'sem'}, 'DataVars', {'mean_rt', 'mean_acc'});

grp2idx(tbl.subject_id);

Xoff = linspace(-.05,0.05,4)

figure; hold on;
nexttile; hold on;
errorbar(...
    [1:4] + Xoff(1),...
    gt_alerting_flanker_group1.mean_mean_rt(ismember(gt_alerting_flanker_group1.flanker_congruency_cat, 'congruent')),...
    gt_alerting_flanker_group1.sem_mean_rt(ismember(gt_alerting_flanker_group1.flanker_congruency_cat, 'congruent')), '-ob',...
    'MarkerFaceColor', 'b', 'LineWidth', 1)
errorbar(...
    [1:4] + Xoff(2),...
    gt_alerting_flanker_group1.mean_mean_rt(ismember(gt_alerting_flanker_group1.flanker_congruency_cat, 'incongruent')),...
    gt_alerting_flanker_group1.sem_mean_rt(ismember(gt_alerting_flanker_group1.flanker_congruency_cat, 'incongruent')), '-oc',...
    'MarkerFaceColor', 'c', 'LineWidth', 1)


xlim([0.5,4.5])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'Double', 'Invalid', 'Valid', 'None'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'Congruent', 'Incongruent'})
title('Cues x Flanker (RT)')

nexttile; hold on;


gt_engaging_flanker = grpstats(tbl, {'subject_id', 'engaging', 'flanker_congruency_cat'}, {'mean', 'std'}, 'DataVars', {'rt'});
gt_engaging_flanker_group = grpstats(gt_engaging_flanker, {'engaging', 'flanker_congruency_cat'}, {'mean', 'sem'}, 'DataVars', {'mean_rt'});


xAxis = [1, 2];

errorbar(xAxis, gt_engaging_flanker_group.mean_mean_rt(...
    ismember(gt_engaging_flanker_group.engaging, [-1, 1])...
    & ismember(gt_engaging_flanker_group.flanker_congruency_cat, 'congruent')),...
    gt_engaging_flanker_group.sem_mean_rt(...
    ismember(gt_engaging_flanker_group.engaging, [-1, 1])...
    & ismember(gt_engaging_flanker_group.flanker_congruency_cat, 'congruent')),...
    '-ob', 'MarkerFaceColor', 'b', 'LineWidth', 1)


errorbar(xAxis, gt_engaging_flanker_group.mean_mean_rt(...
    ismember(gt_engaging_flanker_group.engaging, [-1, 1])...
    & ismember(gt_engaging_flanker_group.flanker_congruency_cat, 'incongruent')),...
    gt_engaging_flanker_group.sem_mean_rt(...
    ismember(gt_engaging_flanker_group.engaging, [-1, 1])...
    & ismember(gt_engaging_flanker_group.flanker_congruency_cat, 'incongruent')),...
    '-oc', 'MarkerFaceColor', 'c', 'LineWidth', 1)


xlim([0,3])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'Double', 'Valid'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'Congruent', 'Incongruent'})
title('Engaging x Flanker (RT)')

nexttile; hold on;


gt_alerting_flanker = grpstats(tbl, {'subject_id', 'alerting', 'flanker_congruency_cat'}, {'mean', 'std'}, 'DataVars', {'rt'});
gt_alerting_flanker_group = grpstats(gt_alerting_flanker, {'alerting', 'flanker_congruency_cat'}, {'mean', 'sem'}, 'DataVars', {'mean_rt'})

xAxis = [1, 2];

errorbar(xAxis, gt_alerting_flanker_group.mean_mean_rt(...
    ismember(gt_alerting_flanker_group.alerting, [-1, 1])...
    & ismember(gt_alerting_flanker_group.flanker_congruency_cat, 'congruent')),...
    gt_alerting_flanker_group.sem_mean_rt(...
    ismember(gt_alerting_flanker_group.alerting, [-1, 1])...
    & ismember(gt_alerting_flanker_group.flanker_congruency_cat, 'congruent')),...
    '-ob', 'MarkerFaceColor', 'b', 'LineWidth', 1)


errorbar(xAxis, gt_alerting_flanker_group.mean_mean_rt(...
    ismember(gt_alerting_flanker_group.alerting, [-1, 1])...
    & ismember(gt_alerting_flanker_group.flanker_congruency_cat, 'incongruent')),...
    gt_alerting_flanker_group.sem_mean_rt(...
    ismember(gt_alerting_flanker_group.alerting, [-1, 1])...
    & ismember(gt_alerting_flanker_group.flanker_congruency_cat, 'incongruent')),...
    '-oc', 'MarkerFaceColor', 'c', 'LineWidth', 1)


xlim([0,3])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'None', 'Double'})
legend({'Congruent', 'Incongruent'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
title('Alerting x Flanker (LogRT)')

nexttile; hold on;


gt_disengaging_flanker = grpstats(tbl, {'subject_id', 'disengaging', 'flanker_congruency_cat'}, {'mean', 'std'}, 'DataVars', {'rt'});
gt_disengaging_flanker_group = grpstats(gt_disengaging_flanker, {'disengaging', 'flanker_congruency_cat'}, {'mean', 'sem'}, 'DataVars', {'mean_rt'});

xAxis = [1, 2];

errorbar(xAxis, gt_disengaging_flanker_group.mean_mean_rt(...
    ismember(gt_disengaging_flanker_group.disengaging, [1, -1])...
    & ismember(gt_disengaging_flanker_group.flanker_congruency_cat, 'congruent')),...
    gt_disengaging_flanker_group.sem_mean_rt(...
    ismember(gt_disengaging_flanker_group.disengaging, [1, -1])...
    & ismember(gt_disengaging_flanker_group.flanker_congruency_cat, 'congruent')),...
    '-ob', 'MarkerFaceColor', 'b', 'LineWidth', 1)

errorbar(xAxis, gt_disengaging_flanker_group.mean_mean_rt(...
    ismember(gt_disengaging_flanker_group.disengaging, [1, -1])...
    & ismember(gt_disengaging_flanker_group.flanker_congruency_cat, 'incongruent')),...
    gt_disengaging_flanker_group.sem_mean_rt(...
    ismember(gt_disengaging_flanker_group.disengaging, [-1, 1])...
    & ismember(gt_disengaging_flanker_group.flanker_congruency_cat, 'incongruent')),...
    '-oc', 'MarkerFaceColor', 'c', 'LineWidth', 1)


xlim([0,3])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'Valid', 'Invalid'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'Congruent', 'Incongruent'})
title('Disengaging x Flanker (RT)')

%% Cue x Flanker (Acc)


gt_alerting_flanker1 = grpstats(tbl, {'subject_id', 'cue', 'flanker_congruency_cat'}, {'mean', 'std'}, 'DataVars', {'rt', 'acc'});

gt_alerting_flanker_group1 = grpstats(gt_alerting_flanker1, {'cue', 'flanker_congruency_cat'}, {'mean', 'sem'}, 'DataVars', {'mean_acc'});

grp2idx(tbl.subject_id);

Xoff = linspace(-.05,0.05,4)

figure; hold on;
nexttile; hold on;
errorbar(...
    [1:4] + Xoff(1),...
    gt_alerting_flanker_group1.mean_mean_acc(ismember(gt_alerting_flanker_group1.flanker_congruency_cat, 'congruent')),...
    gt_alerting_flanker_group1.sem_mean_acc(ismember(gt_alerting_flanker_group1.flanker_congruency_cat, 'congruent')), '-ob',...
    'MarkerFaceColor', 'b', 'LineWidth', 1)
errorbar(...
    [1:4] + Xoff(2),...
    gt_alerting_flanker_group1.mean_mean_acc(ismember(gt_alerting_flanker_group1.flanker_congruency_cat, 'incongruent')),...
    gt_alerting_flanker_group1.sem_mean_acc(ismember(gt_alerting_flanker_group1.flanker_congruency_cat, 'incongruent')), '-oc',...
    'MarkerFaceColor', 'c', 'LineWidth', 1)


xlim([0.5,4.5])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'Double', 'Invalid', 'Valid', 'None'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'Congruent', 'Incongruent'})
title('Cues x Flanker (Acc)')

nexttile; hold on;


gt_engaging_flanker = grpstats(tbl, {'subject_id', 'engaging', 'flanker_congruency_cat'}, {'mean', 'std'}, 'DataVars', {'acc'});
gt_engaging_flanker_group = grpstats(gt_engaging_flanker, {'engaging', 'flanker_congruency_cat'}, {'mean', 'sem'}, 'DataVars', {'mean_acc'});


xAxis = [1, 2];

errorbar(xAxis, gt_engaging_flanker_group.mean_mean_acc(...
    ismember(gt_engaging_flanker_group.engaging, [-1, 1])...
    & ismember(gt_engaging_flanker_group.flanker_congruency_cat, 'congruent')),...
    gt_engaging_flanker_group.sem_mean_acc(...
    ismember(gt_engaging_flanker_group.engaging, [-1, 1])...
    & ismember(gt_engaging_flanker_group.flanker_congruency_cat, 'congruent')),...
    '-ob', 'MarkerFaceColor', 'b', 'LineWidth', 1)


errorbar(xAxis, gt_engaging_flanker_group.mean_mean_acc(...
    ismember(gt_engaging_flanker_group.engaging, [-1, 1])...
    & ismember(gt_engaging_flanker_group.flanker_congruency_cat, 'incongruent')),...
    gt_engaging_flanker_group.sem_mean_acc(...
    ismember(gt_engaging_flanker_group.engaging, [-1, 1])...
    & ismember(gt_engaging_flanker_group.flanker_congruency_cat, 'incongruent')),...
    '-oc', 'MarkerFaceColor', 'c', 'LineWidth', 1)


xlim([0,3])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'Double', 'Valid'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'Congruent', 'Incongruent'})
title('Engaging x Flanker (Acc)')

nexttile; hold on;


gt_alerting_flanker = grpstats(tbl, {'subject_id', 'alerting', 'flanker_congruency_cat'}, {'mean', 'std'}, 'DataVars', {'acc'});
gt_alerting_flanker_group = grpstats(gt_alerting_flanker, {'alerting', 'flanker_congruency_cat'}, {'mean', 'sem'}, 'DataVars', {'mean_acc'})

xAxis = [1, 2];

errorbar(xAxis, gt_alerting_flanker_group.mean_mean_acc(...
    ismember(gt_alerting_flanker_group.alerting, [-1, 1])...
    & ismember(gt_alerting_flanker_group.flanker_congruency_cat, 'congruent')),...
    gt_alerting_flanker_group.sem_mean_acc(...
    ismember(gt_alerting_flanker_group.alerting, [-1, 1])...
    & ismember(gt_alerting_flanker_group.flanker_congruency_cat, 'congruent')),...
    '-ob', 'MarkerFaceColor', 'b', 'LineWidth', 1)


errorbar(xAxis, gt_alerting_flanker_group.mean_mean_acc(...
    ismember(gt_alerting_flanker_group.alerting, [-1, 1])...
    & ismember(gt_alerting_flanker_group.flanker_congruency_cat, 'incongruent')),...
    gt_alerting_flanker_group.sem_mean_acc(...
    ismember(gt_alerting_flanker_group.alerting, [-1, 1])...
    & ismember(gt_alerting_flanker_group.flanker_congruency_cat, 'incongruent')),...
    '-oc', 'MarkerFaceColor', 'c', 'LineWidth', 1)


xlim([0,3])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'None', 'Double'})
legend({'Congruent', 'Incongruent'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
title('Alerting x Flanker (Acc)')

nexttile; hold on;


gt_disengaging_flanker = grpstats(tbl, {'subject_id', 'disengaging', 'flanker_congruency_cat'}, {'mean', 'std'}, 'DataVars', {'acc'});
gt_disengaging_flanker_group = grpstats(gt_disengaging_flanker, {'disengaging', 'flanker_congruency_cat'}, {'mean', 'sem'}, 'DataVars', {'mean_acc'});

xAxis = [1, 2];

errorbar(xAxis, gt_disengaging_flanker_group.mean_mean_acc(...
    ismember(gt_disengaging_flanker_group.disengaging, [1, -1])...
    & ismember(gt_disengaging_flanker_group.flanker_congruency_cat, 'congruent')),...
    gt_disengaging_flanker_group.sem_mean_acc(...
    ismember(gt_disengaging_flanker_group.disengaging, [1, -1])...
    & ismember(gt_disengaging_flanker_group.flanker_congruency_cat, 'congruent')),...
    '-ob', 'MarkerFaceColor', 'b', 'LineWidth', 1)

errorbar(xAxis, gt_disengaging_flanker_group.mean_mean_acc(...
    ismember(gt_disengaging_flanker_group.disengaging, [1, -1])...
    & ismember(gt_disengaging_flanker_group.flanker_congruency_cat, 'incongruent')),...
    gt_disengaging_flanker_group.sem_mean_acc(...
    ismember(gt_disengaging_flanker_group.disengaging, [-1, 1])...
    & ismember(gt_disengaging_flanker_group.flanker_congruency_cat, 'incongruent')),...
    '-oc', 'MarkerFaceColor', 'c', 'LineWidth', 1)


xlim([0,3])
xticks([1:length(gt_alerting_flanker_group1.cue)])
xticklabels({'Valid', 'Invalid'})
set(gca, 'TickDir', 'out', 'LineWidth', 1)
legend({'Congruent', 'Incongruent'})
title('Disengaging x Flanker (Acc)')
