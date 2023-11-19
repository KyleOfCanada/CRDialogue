
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
| Ashley   |  6520 |    2547 |  2.56 |
| Laura    | 19181 |    9307 |  2.06 |
| Sam      | 17179 |    8922 |  1.93 |
| Marisha  | 14663 |    8623 |  1.70 |
| Travis   | 15220 |    8971 |  1.70 |
| Liam     | 12292 |    7521 |  1.63 |
| Taliesin | 13979 |    9309 |  1.50 |

We can see that while Liam is in the bottom half of the table, Taliesin
has a lower score.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
| :------- | -------: | -------: | ----: |
| Ashley   |     6761 |    12980 |  1.92 |
| Laura    |    24042 |    41271 |  1.72 |
| Sam      |    20940 |    34201 |  1.63 |
| Taliesin |    22509 |    31172 |  1.38 |
| Liam     |    19572 |    26240 |  1.34 |
| Marisha  |    24470 |    31852 |  1.30 |
| Travis   |    25015 |    31292 |  1.25 |

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
