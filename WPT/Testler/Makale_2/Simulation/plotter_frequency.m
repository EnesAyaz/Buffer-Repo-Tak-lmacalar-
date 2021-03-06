
filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\1P2S_Detuned_Aligned.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%s%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', ...
    delimiter, 'TextType', 'string', 'HeaderLines' ...
    ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));
for col=[1,2]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells
P2SDetunedAligned = cell2mat(raw);
clearvars filename delimiter startRow formatSpec fileID ...
    dataArray ans raw col numericData rawData row regexstr ...
    result numbers invalidThousandsSeparator thousandsRegExp R;

%

filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\1P2S_Detuned_misaligned_19.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%s%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', ...
    delimiter, 'TextType', 'string', 'HeaderLines' ...
    ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));
for col=[1,2]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells
P2SDetunedMisligned19 = cell2mat(raw);
clearvars filename delimiter startRow formatSpec fileID ...
    dataArray ans raw col numericData rawData row regexstr ...
    result numbers invalidThousandsSeparator thousandsRegExp R;

%
filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\1P2S_Detuned_misaligned_18.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%s%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', ...
    delimiter, 'TextType', 'string', 'HeaderLines' ...
    ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));
for col=[1,2]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells
P2SDetunedMisligned18 = cell2mat(raw);
clearvars filename delimiter startRow formatSpec fileID ...
    dataArray ans raw col numericData rawData row regexstr ...
    result numbers invalidThousandsSeparator thousandsRegExp R;

%%

filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\1P2S_Detuned_Aligned_Is1_Is2.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%s%s%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', ...
    delimiter, 'TextType', 'string', 'HeaderLines' ...
    ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);

raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2,3]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end

R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

P2SDetunedAlignedIs1Is2 = cell2mat(raw);
clearvars filename delimiter startRow formatSpec fileID ...
    dataArray ans raw col numericData rawData row regexstr ...
    result numbers invalidThousandsSeparator thousandsRegExp R;

%%

%%

filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\1P2S_Detuned_misaligned_19_Is1_Is2.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%s%s%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', ...
    delimiter, 'TextType', 'string', 'HeaderLines' ...
    ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);

raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2,3]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end

R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

P2SDetunedAlignedIs1Is2_19 = cell2mat(raw);
clearvars filename delimiter startRow formatSpec fileID ...
    dataArray ans raw col numericData rawData row regexstr ...
    result numbers invalidThousandsSeparator thousandsRegExp R;

%%
filename = 'Y:\Github\Studies\WPT\Testler\Makale_2\Simulation\1P2S_Detuned_misaligned_18_Is1_Is2.txt';
delimiter = '\t';
startRow = 2;
formatSpec = '%s%s%s%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', ...
    delimiter, 'TextType', 'string', 'HeaderLines' ...
    ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
fclose(fileID);

raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2,3]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end

R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

P2SDetunedAlignedIs1Is2_18 = cell2mat(raw);
clearvars filename delimiter startRow formatSpec fileID ...
    dataArray ans raw col numericData rawData row regexstr ...
    result numbers invalidThousandsSeparator thousandsRegExp R;


%%
figure();
plot(P2SDetunedAligned(:,1)/1000,(P2SDetunedAligned(:,2)),'-','Color','r','LineWidth',2)
hold on;
plot(P2SDetunedMisligned18(:,1)/1000,(P2SDetunedMisligned18(:,2)),'--','Color','g','LineWidth',2)
hold on;
plot(P2SDetunedMisligned19(:,1)/1000,(P2SDetunedMisligned19(:,2)),':','Color','b','LineWidth',2)
title('135kHz Receivers ' ,'FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
lgnd=legend({'Full-Aligned', ...
    'Misaligned with  \DeltaM = 0.74 \muH','Misaligned with \DeltaM =1.48 \muH'},'FontSize',10,'Box','off');
set(lgnd,'color','none');
ylabel('Gain (dB)' ,'FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
xlabel('Frequency(kHz)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)

grid on;


%%
figure();
subplot(3,1,1)
plot(P2SDetunedAligned(:,1)/1000,(P2SDetunedAligned(:,2)),'-','Color','r','LineWidth',2)
hold on;
plot(P2SDetunedMisligned18(:,1)/1000,(P2SDetunedMisligned18(:,2)),'--','Color','g','LineWidth',2)
hold on;
plot(P2SDetunedMisligned19(:,1)/1000,(P2SDetunedMisligned19(:,2)),':','Color','b','LineWidth',2)
title('135kHz Receivers ' ,'FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
lgnd=legend({'Full-Aligned', ...
    'Misaligned with  \DeltaM = 0.74 \muH','Misaligned with \DeltaM =1.48 \muH'},'FontSize',10,'Box','off');
set(lgnd,'color','none');
ylabel('Gain (dB)' ,'FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
xlabel('Frequency(kHz)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)

grid on;

subplot(3,1,2)

plot(P2SDetunedAlignedIs1Is2(:,1)/1000,(P2SDetunedAlignedIs1Is2(:,2)),'-','Color','r','LineWidth',2)
hold on;
plot(P2SDetunedAlignedIs1Is2_19(:,1)/1000,(P2SDetunedAlignedIs1Is2_19(:,2)),'--','Color','g','LineWidth',2)
hold on;
plot(P2SDetunedAlignedIs1Is2_18(:,1)/1000,(P2SDetunedAlignedIs1Is2_18(:,2)),':','Color','b','LineWidth',2)
title('135kHz Receivers ' ,'FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
lgnd=legend({'Full-Aligned', ...
    'Misaligned with  \DeltaM = 0.74 \muH','Misaligned with \DeltaM =1.48 \muH'},'FontSize',10,'Box','off');
set(lgnd,'color','none');
ylabel('Gain (dB)' ,'FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
xlabel('Frequency(kHz)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)

grid on;

subplot(3,1,3)

plot(P2SDetunedAlignedIs1Is2(:,1)/1000,(P2SDetunedAlignedIs1Is2(:,3)),'-','Color','r','LineWidth',2)
hold on;
plot(P2SDetunedAlignedIs1Is2_19(:,1)/1000,(P2SDetunedAlignedIs1Is2_19(:,3)),'--','Color','g','LineWidth',2)
hold on;
plot(P2SDetunedAlignedIs1Is2_18(:,1)/1000,(P2SDetunedAlignedIs1Is2_18(:,3)),':','Color','b','LineWidth',2)
title('135kHz Receivers ' ,'FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
lgnd=legend({'Full-Aligned', ...
    'Misaligned with  \DeltaM = 0.74 \muH','Misaligned with \DeltaM =1.48 \muH'},'FontSize',10,'Box','off');
set(lgnd,'color','none');
ylabel('Gain (dB)' ,'FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)
xlabel('Frequency(kHz)','FontWeight','bold' ...
    ,'Interpreter','latex','FontSize',12)

grid on;


