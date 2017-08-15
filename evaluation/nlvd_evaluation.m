function [] =  nlvd_evaluation(test_title, dataset_name, subset_name, parallel)

if ~exist('test_title', 'var') || isempty(teste_title)
    test_title = 'dbnet_vgg16';
end

if ~exist('dataset_name', 'var') || isempty(dataset_name)
    dataset_name = 'flickr30k';
    %dataset_name = 'vg_v1';
end

if ~exist('subset_name', 'var') || isempty(subset_name)
    subset_name = 'test';
end

if ~exist('parallel', 'var') || isempty(parallel)
    parallel = true;
end

%root_dir = fileparts(fileparts(mfilename('fullpath')));
root_dir = '../';
output_dir = fullfile(root_dir, 'results', dataset_name, test_title);

result_file = 'level_0_0.txt'

if exist(fullfile(output_dir, result_file), 'file')
    fprintf('Evaluate localization based on the level_0.txt \n');
    eval_localization(fullfile(output_dir, result_file), subset_name, test_title, dataset_name);
    fprintf('Evaluate detection based on level_0.txt \n');
    eval_detection(fullfile(output_dir, result_file), 0, parallel,subset_name, test_title, dataset_name);
end

if exist(fullfile(output_dir, 'level_1.txt'), 'file')
    fprintf('Evaluate detection based on level_1.txt \n');
    eval_detection(fullfile(output_dir, 'level_1.txt'), 1, parallel,subset_name, test_title, dataset_name);
end

if exist(fullfile(output_dir, 'level_2.txt'), 'file')
    fprintf('Evaluate detection based on level_2.txt \n');
    eval_detection(fullfile(output_dir, 'level_2.txt'), 2, parallel,subset_name, test_title, dataset_name);
end


