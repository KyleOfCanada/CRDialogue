# CRDialogue
An exploration of the dialogue from Critical Role

### Does Liam play the saddest bois? A word sentiment analysis of cast dialoge

Liam has a reputation for playing sad characters, but is this deserved? Does his dialogue contain more sad words than the rest of the cast?

To answer this I searched the dialogue from the show for words associated with a sad sentiment, and words associated with joy as a control. I then calculated the ratio of joyful to sad words for each cast member and plotted it.

![joyful vs sad](https://github.com/KyleOfCanada/CRDialogue/raw/main/plots/joySadPlot.png)


|Name     |   Joy| Sadness| Ratio|
|:--------|-----:|-------:|-----:|
|Ashley   |  3168|    1526|  2.08|
|Laura    | 14341|    7304|  1.96|
|Sam      | 13199|    7207|  1.83|
|Marisha  | 10873|    6522|  1.67|
|Liam     |  9718|    6099|  1.59|
|Travis   | 10335|    6783|  1.52|
|Taliesin | 10754|    7724|  1.39|

We can see that while Liam is in the bottom half, both Travis and Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for words with either a positive or negative sentiment.

![positive vs negative](https://github.com/KyleOfCanada/CRDialogue/raw/main/plots/positiveNegativePlot.png)


|Name     | Negative| Positive| Ratio|
|:--------|--------:|--------:|-----:|
|Laura    |    18281|    30260|  1.66|
|Sam      |    16287|    24839|  1.53|
|Ashley   |     4100|     6234|  1.52|
|Taliesin |    15411|    22912|  1.49|
|Marisha  |    17907|    23743|  1.33|
|Liam     |    15753|    20601|  1.31|
|Travis   |    17945|    22596|  1.26|

Again Liam is near the bottom, but Travis still has a lower score.

### Acknowledgments
The data come from the [Critical Role Linkable transcripts](https://kryogenix.org/crsearch/). Last updated with data from campaign 2 episode 120.

Huge thanks to the cast and crew of [Critical Role](critrole.com).