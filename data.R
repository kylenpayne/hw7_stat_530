#data.R

# data processing code
targets <- readTargets(file='targets.txt', 
path='/Users/kylepayne/Google Drive/Kyle/UIUC/Spring 2015/Stat 530/hw/hw7/counts')


# store the files as a list

raw_counts <- readDGE(targets$file,
        path='/Users/kylepayne/Google Drive/Kyle/UIUC/Spring 2015/Stat 530/hw/hw7/counts',
        comment.char="_")
