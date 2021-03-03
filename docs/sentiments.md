### Does Liam play the saddest bois? A word sentiment analysis of cast dialogue

Liam has a reputation for playing sad characters, but is this deserved? Does his dialogue contain more sad words than the rest of the cast?

To answer this I searched the dialogue from the show for words associated with a sad sentiment, and words associated with joy as a control. I then calculated the ratio of joyful to sad words for each cast member and plotted it.

![joyful vs sad](https://github.com/KyleOfCanada/CRDialogue/raw/main/plots/joySadPlot.png)


|Name     |   Joy| Sadness| Ratio|
|:--------|-----:|-------:|-----:|
|Ashley   |  2403|    1151|  2.09|
|Laura    | 12552|    6409|  1.96|
|Sam      | 10464|    5924|  1.77|
|Marisha  |  9196|    5633|  1.63|
|Liam     |  7616|    4852|  1.57|
|Travis   |  8555|    5600|  1.53|
|Taliesin |  8795|    6290|  1.40|

We can see that while Liam is in the bottom half, both Travis and Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for words with either a positive or negative sentiment.

![positive vs negative](https://github.com/KyleOfCanada/CRDialogue/raw/main/plots/positiveNegativePlot.png)


|Name     | Negative| Positive| Ratio|
|:--------|--------:|--------:|-----:|
|Laura    |    16289|    26954|  1.65|
|Ashley   |     2956|     4761|  1.61|
|Sam      |    13472|    20431|  1.52|
|Taliesin |    12905|    19185|  1.49|
|Liam     |    12719|    16934|  1.33|
|Marisha  |    15875|    20614|  1.30|
|Travis   |    15133|    19233|  1.27|

Again Liam is near the bottom, but Travis still has a lower score.