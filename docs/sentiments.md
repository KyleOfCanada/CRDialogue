
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
| Ashley   |  5858 |    2307 |  2.54 |
| Laura    | 18158 |    8869 |  2.05 |
| Sam      | 16048 |    8459 |  1.90 |
| Marisha  | 13670 |    8060 |  1.70 |
| Travis   | 14131 |    8375 |  1.69 |
| Liam     | 11516 |    7147 |  1.61 |
| Taliesin | 13135 |    8755 |  1.50 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
| :------- | -------: | -------: | ----: |
| Ashley   |     6077 |    11432 |  1.88 |
| Laura    |    22826 |    39231 |  1.72 |
| Sam      |    19771 |    32080 |  1.62 |
| Taliesin |    20644 |    29289 |  1.42 |
| Liam     |    18559 |    24876 |  1.34 |
| Marisha  |    23081 |    30074 |  1.30 |
| Travis   |    23450 |    29551 |  1.26 |

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
