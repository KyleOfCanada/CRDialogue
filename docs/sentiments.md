### Does Liam play the saddest bois? A word sentiment analysis of cast dialogue

Liam has a reputation for playing sad characters, but is this deserved? Does his dialogue contain more sad words than the rest of the cast?

To answer this I searched the dialogue from the show for words associated with a sad sentiment, and words associated with joy as a control. I then calculated the ratio of joyful to sad words for each cast member and plotted it.

![joyful vs sad](https://github.com/KyleOfCanada/CRDialogue/raw/main/plots/joySadPlot.png)


|Name     |   Joy| Sadness| Ratio|
|:--------|-----:|-------:|-----:|
|Ashley   |  2256|    1110|  2.03|
|Laura    | 12274|    6342|  1.94|
|Sam      | 10290|    5873|  1.75|
|Marisha  |  9042|    5606|  1.61|
|Liam     |  7450|    4786|  1.56|
|Travis   |  8363|    5604|  1.49|
|Taliesin |  8735|    6313|  1.38|

We can see that while Liam is in the bottom half, both Travis and Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for words with either a positive or negative sentiment.

![positive vs negative](https://github.com/KyleOfCanada/CRDialogue/raw/main/plots/positiveNegativePlot.png)


|Name     | Negative| Positive| Ratio|
|:--------|--------:|--------:|-----:|
|Laura    |    15929|    26168|  1.64|
|Ashley   |     2781|     4499|  1.62|
|Sam      |    12936|    19884|  1.54|
|Taliesin |    12537|    18725|  1.49|
|Liam     |    12289|    16376|  1.33|
|Marisha  |    15407|    19953|  1.30|
|Travis   |    14737|    18656|  1.27|

Again Liam is near the bottom, but Travis still has a lower score.