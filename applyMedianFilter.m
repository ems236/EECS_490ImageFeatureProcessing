function imgCopy=applyMedianFilter(img, size)
    imgCopy = applyNonlinearFilter(img, @median, size);