
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
| Ashley   |  6726 |    2609 |  2.58 |
| Laura    | 19373 |    9379 |  2.07 |
| Sam      | 17402 |    9023 |  1.93 |
| Travis   | 15472 |    9067 |  1.71 |
| Marisha  | 14861 |    8715 |  1.71 |
| Liam     | 12429 |    7574 |  1.64 |
| Taliesin | 14144 |    9430 |  1.50 |

We can see that while Liam is in the bottom half of the table, Taliesin
has a lower score.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
| :------- | -------: | -------: | ----: |
| Ashley   |     6950 |    13444 |  1.93 |
| Laura    |    24256 |    41700 |  1.72 |
| Sam      |    21192 |    34609 |  1.63 |
| Taliesin |    22881 |    31560 |  1.38 |
| Liam     |    19736 |    26459 |  1.34 |
| Marisha  |    24681 |    32125 |  1.30 |
| Travis   |    25325 |    31673 |  1.25 |

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
