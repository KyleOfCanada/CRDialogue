
### Does Liam play the saddest bois? A word sentiment analysis of cast dialogue

Liam has a reputation for playing sad characters, but is this deserved?
Does his dialogue contain more sad words than the rest of the cast?

To answer this I searched the dialogue from the show for words
associated with a sad sentiment, and words associated with joy as a
control. I then calculated the ratio of joyful to sad words for each
cast member and plotted it.

![joyful vs sad](../plots/joySadPlot.png)

| Name     |   Joy | Sadness | Ratio |
| :------- | ----: | ------: | ----: |
| Robbie   |   169 |      71 |  2.38 |
| Ashley   |  3292 |    1511 |  2.18 |
| Laura    | 14815 |    7315 |  2.03 |
| Sam      | 12406 |    6914 |  1.79 |
| Marisha  | 10894 |    6699 |  1.63 |
| Travis   | 10270 |    6475 |  1.59 |
| Liam     |  9424 |    5966 |  1.58 |
| Taliesin | 10523 |    7245 |  1.45 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
| :------- | -------: | -------: | ----: |
| Laura    |    18851 |    32046 |  1.70 |
| Ashley   |     4037 |     6476 |  1.60 |
| Robbie   |      258 |      412 |  1.60 |
| Sam      |    16026 |    24662 |  1.54 |
| Taliesin |    15458 |    23157 |  1.50 |
| Liam     |    15433 |    20941 |  1.36 |
| Marisha  |    19015 |    24801 |  1.30 |
| Travis   |    17728 |    22954 |  1.29 |

Again Liam is near the bottom, but Travis still has a lower score.

-----

### References for lexicons

Hu, M., & Liu, B. (2004). Mining and summarizing customer reviews.
Proceedings of the 2004 ACM SIGKDD International Conference on Knowledge
Discovery and Data Mining - KDD ’04, 168.
<https://doi.org/10.1145/1014052.1014073>

Mohammad, S. M., & Turney, P. D. (2013). Crowdsourcing a Word–Emotion
Association Lexicon. Computational Intelligence, 29(3), 436–465.
<https://doi.org/10.1111/j.1467-8640.2012.00460.x>

Nielsen, F. Å. (2011). A new ANEW: Evaluation of a word list for
sentiment analysis in microblogs. ArXiv:1103.2903 \[Cs\].
<http://arxiv.org/abs/1103.2903>
