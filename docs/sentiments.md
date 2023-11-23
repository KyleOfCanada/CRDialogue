
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
| Ashley   |  6585 |    2569 |  2.56 |
| Laura    | 19224 |    9322 |  2.06 |
| Sam      | 17226 |    8941 |  1.93 |
| Marisha  | 14721 |    8667 |  1.70 |
| Travis   | 15297 |    9013 |  1.70 |
| Liam     | 12292 |    7521 |  1.63 |
| Taliesin | 14045 |    9362 |  1.50 |

We can see that while Liam is in the bottom half of the table, Taliesin
has a lower score.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
| :------- | -------: | -------: | ----: |
| Ashley   |     6824 |    13088 |  1.92 |
| Laura    |    24094 |    41357 |  1.72 |
| Sam      |    20999 |    34306 |  1.63 |
| Taliesin |    22671 |    31311 |  1.38 |
| Liam     |    19572 |    26240 |  1.34 |
| Marisha  |    24544 |    31914 |  1.30 |
| Travis   |    25131 |    31427 |  1.25 |

We can see that while Liam is again in the bottom half of the table,
both Marisha and Travis have lower scores.

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
